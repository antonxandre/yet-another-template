bool hasSuccess(int statusCode) => [
      200,
      201,
      203,
      204,
    ].contains(statusCode);
