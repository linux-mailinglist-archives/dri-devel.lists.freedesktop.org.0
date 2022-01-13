Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC4F48DB49
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 17:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4C410E37E;
	Thu, 13 Jan 2022 16:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9DF10E37E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 16:08:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BACC41F45F4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642090086;
 bh=t9qb5Ze7CYQ8nSCRNMSDQYdvGZu0aR/A+rW9av9GndI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fa1NFsijppdezshg6p0NgQfF46tu+39soQgwxKQrktRW5mJJsC/FaDtjiwg3r96Jg
 9RDBQ75uCWOjnx2XxxkaN3roKDtOga5+Xr8YH2QmfJjL06oa7jkVupJEvOdQ0klZyA
 usJMp2s0HQ65CcV3lh5WkgyvtyS4S7E52HtaoDs5tWmKcHmYSl/Dp/GJxSruSICBcJ
 xKWLqHFbEMs3EMHxzq99XHRWdrqyM9HcEminaXBdNQnlDQkLdPesMYzhXtd7bSi/4W
 1leh0FHm6cllbnWJrzbMVQJhtAj5+yUqhMzKllhDRKdFjevpU4fiIlXtvfk2wE54GY
 pwpFMIWqD48iw==
Subject: Re: [PATCH v11 21/22] drm/mediatek: add mediatek-drm of vdosys1
 support for MT8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>
References: <20220110084645.31191-1-nancy.lin@mediatek.com>
 <20220110084645.31191-22-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <c2750134-9d7d-5aa5-196c-7785c1578e4b@collabora.com>
Date: Thu, 13 Jan 2022 17:08:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110084645.31191-22-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

Il 10/01/22 09:46, Nancy.Lin ha scritto:
> Add driver data of mt8195 vdosys1 to mediatek-drm.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

