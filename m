Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1F74CA1F5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 11:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0600110EE86;
	Wed,  2 Mar 2022 10:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68A610EE85
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 10:14:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D18B01F44C93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646216083;
 bh=CRz1hl04S7o5hFhSfEJ8l4P0iLKv8xFFSD4PLarV2g4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gNDI0v4pUxf2bQQJJvn9Vuebv0Z+f5T03H5csv0tVva6ordHyKgokbRavmSAGxWjB
 q6yx+vho1qMuhf9ON8MvdKwYpQMym2QUm4x5r1ojCIxtMDHsf3gz0TNhiPlXYYW2+S
 L0tmUkYMfPLMxSsdfu7UM3UfmPPWxGEYfHiBJHNxzk0fUdSOVslyQMbgY0PxtKekkY
 SkqJ4uRpsKbbWLdYm+3pxEGbR/nOrRE4cjTZ/0jQkkFETbngW0F/nEyIZgK6/Ab8Fp
 nNw2adEw/r+TcioMZEFl9Lae5hmJyejfsDbik37z8fB/CAicFgN6Nu/HDOgowuj3js
 t3LhNxxJQVCpw==
Message-ID: <909f6957-86c5-1ebc-47b2-73085dd7399a@collabora.com>
Date: Wed, 2 Mar 2022 11:14:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v12 04/23] dt-bindings: reset: mt8195: add vdosys1 reset
 control bit
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>
References: <20220222100741.30138-1-nancy.lin@mediatek.com>
 <20220222100741.30138-5-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220222100741.30138-5-nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 22/02/22 11:07, Nancy.Lin ha scritto:
> Add vdosys1 reset control bit for MT8195 platform.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>



Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
