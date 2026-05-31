import { useState } from 'react';
import ChatBot from './components/chat/ChatBot';
import ReviewList from './components/reviews/ReviewList';

function App() {
   const [activeView, setActiveView] = useState('chat');
   const [productId, setProductId] = useState('');

   return (
      <div className="p-4 h-screen">
         <div className="mb-4 flex items-center gap-2">
            <button
               onClick={() => setActiveView('chat')}
               className={`px-4 py-2 rounded ${
                  activeView === 'chat'
                     ? 'bg-blue-600 text-white'
                     : 'bg-gray-200'
               }`}
            >
               ChatBot
            </button>

            <button
               onClick={() => setActiveView('summary')}
               className={`px-4 py-2 rounded ${
                  activeView === 'summary'
                     ? 'bg-blue-600 text-white'
                     : 'bg-gray-200'
               }`}
            >
               Summarizer
            </button>

            {activeView === 'summary' && (
               <input
                  type="number"
                  placeholder="Enter Product ID"
                  value={productId}
                  onChange={(e) => setProductId(e.target.value)}
                  className="border rounded px-3 py-2"
               />
            )}
         </div>

         {activeView === 'chat' ? (
            <ChatBot />
         ) : (
            productId && <ReviewList productId={Number(productId)} />
         )}
      </div>
   );
}

export default App;
