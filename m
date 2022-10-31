Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FD3613850
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 14:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C30E10E002;
	Mon, 31 Oct 2022 13:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EADD10E002
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 13:45:21 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3E7516602253;
 Mon, 31 Oct 2022 13:45:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667223920;
 bh=FqG5Q9Uq9BODSoedqBA3YlNqZjPSGiArJ7cELbg3dBI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Q+BkQP4mwRLmQ1tdn6vLsPc96vlTiWTXoDR3oAn+hPGADvHLXKQ7xIQwCBGSxh+i5
 0oppqtccMWm7GDIxLgq7STRH4DjocOKPdoEfhHcT3xHgmavC5P32fQDA7ySsgifCjH
 HXk4HD8GMr50Ag3OuwcDC2rsJSS/lUjAaCUfY1wl1LpPOhimRmtLeuWk2lgixQarS/
 UakTBK0eWkW+7XKlxjcnNcsm5MDDx3isM2maXebCimfBXi6fcbCaA69IcuFw3VE8vY
 jR4BjhHz2AdIfevEvrFNoSjhIhIbqzr8H3fCHns4DPaUALb93eYIion+xmK9vbfKxa
 SEEVtIi8/pt7A==
Message-ID: <5329430d-fd58-0872-50d3-b0558f6868df@collabora.com>
Date: Mon, 31 Oct 2022 14:45:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3] dma-buf: cma_heap: Remove duplicated 'by' in comment
Content-Language: en-US
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20221028065533.23856-1-mark-pk.tsai@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221028065533.23856-1-mark-pk.tsai@mediatek.com>
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
Cc: yj.chiang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 28/10/22 08:55, Mark-PK Tsai ha scritto:
> Remove duplicated 'by' from comment in cma_heap_allocate().
> 
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> Reviewed-By: Mukesh Ojha <quic_mojha@quicinc.com>
> Acked-by: John Stultz <jstultz@google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

