Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8795A60F2EC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 10:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E85D10E58E;
	Thu, 27 Oct 2022 08:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A559810E57E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 08:56:45 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 43D8366028C5;
 Thu, 27 Oct 2022 09:56:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666861004;
 bh=a6cv56mnR0Rt8cN4YKAatcPuhZ/rCh1tcmynK4XFuOg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BBuplJME/3Ry9esnd85HoFScshBaCRJ3gPCteMWzG5cHItSysPoYVvyTxm/ztzz5j
 Wds+Y58IPW17ZCZgy6GmiEDamt2BzaHBGx2IEK478u4jtpMgG43BrFEauMA3tZu/Ei
 DRA6ATGcfILQBfMyhPLBO+eqQ/oCMQlyXVlJuuPdtSv0E4KUqqIi2g/PPXIMYya+KH
 k/7XwwTo/ojIVEYTJwoy+rCxNBRR35O5RNtlPrGiheqky5MKtOIUm3eq4VBfdn/FMA
 gvw8IUQvmPi7ryZ5tZiY6MxinnS1cDRqmMG6e3fpPs5cpv4qIiP0jjxIODZL/4HFXH
 raqDX+y8f9VSg==
Message-ID: <54b9bf61-3db0-c2ca-9c30-f2434573be29@collabora.com>
Date: Thu, 27 Oct 2022 10:56:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] dma-buf: cma_heap: Fix typo in comment
Content-Language: en-US
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20221027072642.23787-1-mark-pk.tsai@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221027072642.23787-1-mark-pk.tsai@mediatek.com>
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

Il 27/10/22 09:26, Mark-PK Tsai ha scritto:
> Fix typo in comment.
> 
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


