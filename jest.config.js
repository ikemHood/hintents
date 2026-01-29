// Copyright (c) 2026 dotandev
// SPDX-License-Identifier: MIT OR Apache-2.0

module.exports = {
    preset: 'ts-jest',
    testEnvironment: 'node',
    testMatch: ['**/__tests__/**/*.spec.ts'],
    collectCoverage: true,
    coverageDirectory: 'coverage',
    coveragePathIgnorePatterns: ['/node_modules/'],
};
