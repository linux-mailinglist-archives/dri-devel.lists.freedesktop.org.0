Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD7D5E76B2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 11:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BB410E7D4;
	Fri, 23 Sep 2022 09:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509DA10E7D4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 09:19:45 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 555AC6601BDF;
 Fri, 23 Sep 2022 10:19:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663924784;
 bh=L8D1yTEhULRIAS6lI51HY0j9CE5jcl5Cm2AEs0nABTw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PdlxoKsr0n4pUp6rXaoDv1z95wkQwSDLj9HW9GDDCwAMWLOUl9PsJd4qls4Cpb/zv
 a0nz1P8zzsvcGgGVH0CDWqBUGSgyngy5l9j4nunNfT7s1nqZKct0uyoUSoVik5cPUr
 +O4B0I7GsgWdV6H12y1pS5TMwWIX5c9j/ZUmjhbh1DAENlhoKJUtUF2/gLTFAGUspz
 uS1af1SK84lFDivPwjqXIwHqBgtMS80rJIBXgCXnYEYuy9VD5Csxt3iHrjWayudeX/
 ZsCHnKRrIWeHIc2b9er2iWh4Nx8SFdrUu4VakhREUKGspz5ZheGVbROEpK5V1dyLyL
 lAfVid34fkaUg==
Message-ID: <b11fec5e-0725-be3c-4b4b-0e68bf00c10d@collabora.com>
Date: Fri, 23 Sep 2022 11:19:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9,0/3] Add dpi output format control for MT8186
Content-Language: en-US
To: xinlei.lee@mediatek.com, matthias.bgg@gmail.com,
 jason-jh.lin@mediatek.com, rex-bc.chen@mediatek.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch
References: <1663922440-20242-1-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1663922440-20242-1-git-send-email-xinlei.lee@mediatek.com>
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/09/22 10:40, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Base on the branch of ck-linux-next/mediatek-drm-fixes.
> 

Hello Xinlei,

I've reviewed v8 just some minutes before you pushed this v9.

Can you please make the requested changes from v8 on patch [2/3] and
push a v10 retaining the Reviewed-by tags that I released on v8?

Thanks,
Angelo


