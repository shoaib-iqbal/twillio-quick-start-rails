'use strict';


/**
 * Get a user friendly Error message.
 * @param error - the Error for which a user friendly message is needed
 * @returns {string} the user friendly message
 */
function getUserFriendlyError(error) {
  const errorName = [error.name, error.constructor.name].find(errorName => {
    return errorName in USER_FRIENDLY_ERRORS;
  });
  return errorName ? USER_FRIENDLY_ERRORS[errorName](error) : error.message;
}

