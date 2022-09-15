Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C815B98D2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 12:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0F810EADA;
	Thu, 15 Sep 2022 10:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE4E10E191
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 10:31:40 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 709E76601DA4;
 Thu, 15 Sep 2022 11:31:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663237899;
 bh=cw5utiGORthyeJlMeh2OqxvWGrsBK/NlZJEzrppZ6R0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OLpV6alBN8hdQ9TNr7vdOPIVGnlYEZD+qYoPEHgvObkIQOJ/nyRFde7jI1kHFtSlC
 LMewm2YgVgwoROWlg7d1dOU6dWy0ow83BZHAyYHJJljZY3mcd9PQqK0A94amaSzpcG
 zsn3Smb+3/FitO1oFa0iALsReszrPsNhIPoSBPpXc9fm5KqwgQQwJP7Ih/ZUNyaIYT
 H/xi64row2bgdYsF4kJ+iw4Wa9RnPiTeZVf8BjzeFJS8PGdvDhk6W4q1OE3Pk37cWn
 s3Mml/XdCbj/QYEwRBrPlPd3sXjC9jJWX0to8yq2MfTPalGlYfROlfidDPqOeo1Oec
 E2cqDzzrh/TVg==
Message-ID: <abe4254b-cb81-8a79-9039-36e4c47bc059@collabora.com>
Date: Thu, 15 Sep 2022 12:31:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/3] drm/mediatek: dp: Remove unused register definitions
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie
References: <20220915075028.644-1-rex-bc.chen@mediatek.com>
 <20220915075028.644-3-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915075028.644-3-rex-bc.chen@mediatek.com>
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
Cc: granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 15/09/22 09:50, Bo-Chen Chen ha scritto:
> Some definitions in mtk_dp_reg.h are not used, so remove these
> redundant codes.
> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


