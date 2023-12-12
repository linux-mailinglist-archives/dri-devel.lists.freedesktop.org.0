Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3317880EDBE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 14:33:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B4B10E5F2;
	Tue, 12 Dec 2023 13:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B406310E5F9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 13:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702387644;
 bh=EiuZhr5Xmzs0FwCEPG+Ew4eAAMJCP2ZsrkEzvE1VxkA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=d+QQcCfZGvmR6TTIxeqCgLgChC9poL3EWtIVAUDH49RE8VeFzqRJNNAjX21Ns5vun
 yoWvaEqc1H/HX7edIyHY5JfTkD++6o4vY3/WVs7Sj24KhAEoN6aeP12gsWLlsO+qos
 vXL+L5eCT4uNgy2QSLr7CLXeexvQ/68TLdTLueoNCwyIvw4Ko5nUR5xFGvbhQoqhmk
 HRYmepsXuz6BoWDCIphamzwlH1dSR61XKD1maU1kPtoQ33NMo1f5yIDDfYl1dFpgai
 1S4czM+xMLsW6i16llsWF1ubeeSzUx/ehD39R9BpM7yNsIGYc9RdbM74N3EBcqSBGP
 WD3+0nxoc0RXg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 31E293781463;
 Tue, 12 Dec 2023 13:27:23 +0000 (UTC)
Message-ID: <fbaa1652-8402-4f6e-9f68-fbe16c78ce73@collabora.com>
Date: Tue, 12 Dec 2023 14:27:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/17] drm/mediatek: Add OVL compatible name for MT8195
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>
References: <20231212121957.19231-1-shawn.sung@mediatek.com>
 <20231212121957.19231-5-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231212121957.19231-5-shawn.sung@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Fei Shao <fshao@chromium.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 12/12/23 13:19, Hsiao Chien Sung ha scritto:
> Add OVL compatible name for MT8195.
> 
> Without this commit, DRM won't work after modifying
> the device tree.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


