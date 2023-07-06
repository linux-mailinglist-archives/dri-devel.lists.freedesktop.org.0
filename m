Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6C8749927
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 12:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7063F10E4C5;
	Thu,  6 Jul 2023 10:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB2A10E4C6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 10:14:18 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id ADA64660585C;
 Thu,  6 Jul 2023 11:14:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688638455;
 bh=teT1OjiRap+HP8iW1Gyu0lP/v4LyjAIlwMT2n0OqG7I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cbyxQ6WTKY1badRoEB1wFosnFnBlNUnVPcAW/Ug+3b9HVwuVLEO1+MIwGTzZHMlau
 siOHhUYJ/CFlxV8dr1CLwEEMX+XB/SRWHM9/jD04AaCyMRxd1A3ULaSosbZC0gtj+d
 5dpOQKYoE7fjHPIsWNKr6Isi2+RUKCO6npXO6GvCssvbjrFL+3S5FbV2yT+PAtjIkg
 5Bqm8uLNA97URsEk6ZEC8rVAK9XR6LyouDTXpW9RdplQ5xfZ+626HpHiQRniFtJIzL
 LBrjuNJPuQiUGCq8lUOa9x29i/3U2CutNjGoZ5y5Ey6JVbD7yOzE3Y6EDWF+U6GHL6
 ROznf7K+VDymQ==
Message-ID: <25d2f4ce-8c95-56ff-eb5a-9cf19532d1bc@collabora.com>
Date: Thu, 6 Jul 2023 12:14:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2, 1/2] dt-bindings: display: mediatek: dp: Add compatible
 for MediaTek MT8188
To: Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
References: <20230706021425.31735-1-shuijing.li@mediatek.com>
 <20230706021425.31735-2-shuijing.li@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230706021425.31735-2-shuijing.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 06/07/23 04:14, Shuijing Li ha scritto:
> Add dt-binding documentation of dp-tx for MediaTek MT8188 SoC.
> 
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


