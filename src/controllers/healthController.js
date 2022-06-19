exports.getHealth = async (req, res, next) => {
    try {
        res.status(200).json({
            status: 'healthy'
        });
    } catch (e) {
        res.status(400).json({
            status: 'unhealthy',
        });
    }
};