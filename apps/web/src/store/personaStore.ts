import { create } from 'zustand';

type Persona = 'buyer' | 'cca' | 'partner' | 'admin';

interface PersonaState {
    activePersona: Persona;
    setPersona: (persona: Persona) => void;
}

export const usePersonaStore = create<PersonaState>((set) => ({
    activePersona: 'buyer', // default
    setPersona: (persona) => set({ activePersona: persona }),
}));
