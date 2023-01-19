import { Antagonist, Category } from '../base';
import { multiline } from 'common/string';

export const SCOUNDREL_MECHANICAL_DESCRIPTION = multiline`
      You are a member of the crew with laxed escalation and
      objectives that enable what might be ordinarily forbidden behavior.
      This does not make you an enemy of the crew or a rampant
      murderer, and dealing with immediate crises is more important
      than your objectives.
   `;

const Scoundrel: Antagonist = {
  key: 'scoundrel',
  name: 'Scoundrel',
  description: [
    multiline`
      Mischief is in your nature, not by cold-hearted cruelty but
      an impetuously human desire to cause conflict and assert
      your place in the world. Offer your hand and your backhand in
      equal parts.
    `,
    SCOUNDREL_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Roundstart,
};

export default Scoundrel;
