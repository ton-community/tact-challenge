import { Blockchain, SandboxContract } from '@ton-community/sandbox';
import { toNano } from 'ton-core';
import { Task5 } from '../wrappers/Task5';

describe('Task5', () => {
    let blockchain: Blockchain;
    let task5: SandboxContract<Task5>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        task5 = blockchain.openContract(await Task5.fromInit());
        const deployer = await blockchain.treasury('deployer');
        const deployResult = await task5.send(
            deployer.getSender(),
            {
                value: toNano('0.05'),
            },
            {
                $$type: 'Deploy',
                queryId: 0n,
            }
        );
        expect(deployResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: task5.address,
            deploy: true,
            success: true,
        });
    });

    it('test', async () => {
    });
});



