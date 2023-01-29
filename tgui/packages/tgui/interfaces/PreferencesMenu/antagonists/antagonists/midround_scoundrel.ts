import { Antagonist, Category } from '../base';
import { SCOUNDREL_MECHANICAL_DESCRIPTION } from './scoundrel';
import { multiline } from 'common/string';

const Troublemaker: Antagonist = {
  key: 'troublemaker',
  name: 'Troublemaker',
  description: [
    multiline`
      When you've had enough of dignity and just want to cause problems,
      give in to your desire to shake things up.
    `,
    SCOUNDREL_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Midround,
};

export default Troublemaker;
