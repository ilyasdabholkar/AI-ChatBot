import OpenAI from 'openai';
import { Ollama } from 'ollama';
import { InferenceClient } from '@huggingface/inference';
import summarizePrompts from '../llm/prompts/summarize-reviews.txt';

const openAIClient = new OpenAI({
   apiKey: process.env.OPENAI_API_KEY,
});

const inferenceClient = new InferenceClient(process.env.HF_TOKEN);

const ollamaClient = new Ollama();

type GenerateTextOptions = {
   model?: string;
   prompt: string;
   instructions?: string;
   temperature?: number;
   previousResponseId?: string;
   maxTokens?: number;
};

type GenerateTextResult = {
   id: string;
   text: string;
};

export const llmClient = {
   async generateText({
      model = 'gpt-4o-mini',
      prompt,
      instructions,
      temperature = 0.2,
      maxTokens = 300,
      previousResponseId,
   }: GenerateTextOptions): Promise<GenerateTextResult> {
      const response = await openAIClient.responses.create({
         model,
         input: prompt,
         instructions,
         temperature,
         max_output_tokens: maxTokens,
         previous_response_id: previousResponseId,
      });

      return {
         id: response.id,
         text: response.output_text,
      };
   },
   async summarize(text: string) {
      //Hugging face model
      const output = await inferenceClient.chatCompletion({
         model: 'meta-llama/Llama-3.1-8B-Instruct:novita',
         messages: [
            {
               role: 'system',
               content: summarizePrompts,
            },
            {
               role: 'user',
               content: text,
            },
         ],
      });
      return output.choices[0]?.message.content || '';

      //Ollama local model
      // const output = await ollamaClient.chat({
      //    model: 'tinyllama',
      //    messages: [
      //       {
      //          role: 'system',
      //          content: summarizePrompts,
      //       },
      //       {
      //          role: 'user',
      //          content: text,
      //       },
      //    ]
      // });
      // return output.message.content;
   },
};
