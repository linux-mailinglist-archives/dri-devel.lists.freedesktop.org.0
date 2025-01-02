Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE979FF95D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 13:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F119010E25A;
	Thu,  2 Jan 2025 12:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Xb1eGjPY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542F310E25A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 12:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1735821307;
 bh=os0Cxr0lwd8+rwXJ9k4K8vMInJAZ02qWvwYce/ccerU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Xb1eGjPYY0Q1gMpcj0EOzFqsSBuNzqEDicEnSklEr8GmRSC4wqCzzibGI2VHzets2
 +mHqlmeaWDmGDG2EWT2k0N3SLtJs0VU0aJ+0BBj9LQ6JAP0GH/nQb+ugzGJCG7lp6y
 Rouod0S888w4oOTBkrxRtYhFPM/L82x8FUuOOGRCHP8uTLBuysKqM4naUXbrM1H1kE
 5i9MIf8lEzwS1318CQEkO0CSjd85ASUbHiN2h8HTiZOhFkHuU/xpS5Dv2UADRjuVEb
 cSSnVkg2A0rnx/XI6KZIe/tiUzV8OgtlQR7PX1WtbyZ4Kjlm2vKytGoMutXEUUmj1H
 jowAXaCngckCQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 903C217E156C;
 Thu,  2 Jan 2025 13:35:07 +0100 (CET)
Message-ID: <033b6577-61da-47bb-8e22-3c84d89220e0@collabora.com>
Date: Thu, 2 Jan 2025 13:35:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Remove unneeded semicolon
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
References: <20241230135314.5419-1-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241230135314.5419-1-chunkuang.hu@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 30/12/24 14:53, Chun-Kuang Hu ha scritto:
> cocci warnings: (new ones prefixed by >>)
>>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:1092:2-3: Unneeded semicolon
> 
> Fixes: 4c932840db1d ("drm/mediatek: Implement OF graphs support for display paths")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412022048.kY2ZhxZ4-lkp@intel.com/
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


