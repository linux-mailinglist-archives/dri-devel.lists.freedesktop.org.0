Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3E957C58A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 09:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C7E11243F;
	Thu, 21 Jul 2022 07:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC4F11281D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 07:50:42 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 546D466019C1;
 Thu, 21 Jul 2022 08:50:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658389840;
 bh=bIs4puJF1ypK7T97yrk9nig/lJRabP16hi59FxQjuDk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bOdJVSBHGriYyATXFgE9KN5QI0yyXrQRGdGkqVlP6VGahNZq+yecm7A20jbxHmzEg
 peOnOc/WRPTYNdZp7tIwSY4u8Pu8TB0xfuTgewazEUJGFKM5kNQ14qEtTT6Xo2+1fb
 1uj4ICLpnynC/GtfzhtKzCUn9XCWZW0g6LCMr2tWJIA4HEI4/g1C0tRN/rjtqd1jyr
 wPqKRdCaUDFiQxmLwcKmGwnx/9orW87NH0IKOurRecndfWK8MEIrp+8TwW2+BMxDfE
 WnYd5y5d0NFGY9rx4lmNmFiksC98ACZX7Skccqnx76fkPXw4BQsEYBda0k3Wa9g3zq
 1xRVXWD61qfUw==
Message-ID: <f0c1cbe3-3eb6-7994-eb0b-fc9c919aa1cd@collabora.com>
Date: Thu, 21 Jul 2022 09:50:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/panel-edp: Add panel entry for B120XAN01.0
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Douglas Anderson <dianders@chromium.org>
References: <20220720191158.1590833-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220720191158.1590833-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 20/07/22 21:11, Nícolas F. R. A. Prado ha scritto:
> Add panel identification entry for the AUO B120XAN01.0 (product ID:
> 0x1062) panel.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

