import { Antagonist, Category } from '../base';
import { multiline } from 'common/string';

export const TRAITOR_MECHANICAL_DESCRIPTION = multiline`
      Start with a Syndicate uplink loaded with high-grade gear, and use
      it to take on dubious, dangerous covert objectives that may pit you
      against the station crew.
   `;

const Traitor: Antagonist = {
  key: 'traitor',
  name: 'Syndicate Agent',
  description: [
    multiline`
      An independent agent of the Syndicate. Be it for idealistic principle,
      personal gain, or maybe as a punishment, you've been employed to carry
      out the goals of the Syndicate. Out here, of all places.
    `,
    TRAITOR_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Roundstart,
  priority: -1,
};

export default Traitor;
