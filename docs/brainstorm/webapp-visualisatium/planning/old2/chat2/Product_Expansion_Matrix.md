# PRODUCT EXPANSION: THE IMMERSION SUITE
**Constraint:** No generic "AI Wrappers." All products must serve the "Memory/Legacy" mission.

## 1. AUDIO PRODUCT: "THE VOICE KEEPER"
**Concept:** Audio Styling / Voice Cloning.
* **The Hook:** "Don't just watch the video. Hear him tell the story."
* **Input:** User uploads >5 minutes of audio (VHS rip, voicemail, cassette).
* **Processing:** System trains a `Voice_Model` (RVC/LoRA).
* **Usage:**
    * **User:** Types a script (or uses the Narrative Wizard).
    * **Output:** The video narration is generated in the *relative's* voice.
* **Safety:** "Consent Protocol" required (User must certify rights to the voice).

## 2. TEXT PRODUCT: "THE FAMILY FABLE" (Physical Book)
**Concept:** Narrative generation -> Physical Output.
* **The Hook:** "Turn your family history into a bedtime story."
* **Input:**
    * Visuals: 10 Family Photos.
    * Narrative: Answers from the "Interactive Wizard" (Grandpa was brave, loved fishing).
* **Processing:**
    * LLM generates a 10-page story: "The Adventures of Captain Grandpa."
    * Image Gen (ControlNet): Stylizes the photos into "Watercolor Illustrations."
* **Output:** A physical Hardcover Book (via Print Partner).

## 3. INTERACTIVE PRODUCT: "THE DIGITAL SEANCE" (Chat)
**Concept:** A conversational interface with the `Digital_Person`.
* **The Hook:** "Ask your history questions."
* **Input:** The `Lore_Bible.txt` + `Voice_Model`.
* **Mechanism:** RAG (Retrieval Augmented Generation). The AI answers based *only* on the uploaded documents/letters.
* **UX:** It is not a chat window. It is a "Video Call" interface where the Digital Person (Animated Head) speaks the answers.

## 4. HYBRID PRODUCT: "THE TIME CAPSULE"
**Concept:** Delayed Delivery.
* **Logic:** User creates a video/message *now*.
* **Trigger:** "Deliver to [Email] on [Date: 2030-01-01]."
* **Business Value:** Long-term retention. Keeps the account active.