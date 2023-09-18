Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4955C7A4576
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6835610E22C;
	Mon, 18 Sep 2023 09:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093E410E22B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:06:27 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3D49E6607083;
 Mon, 18 Sep 2023 10:06:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695027985;
 bh=ZNtyNW62zjspEPudHJr6SXTUwT0rpU4X7UOJOlD7GTA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LOt26kMneQp6FbI5o8wymzryUX7DiD9PSiZvDjEIEhiPdvMkZiMJOI+lFx7oItgps
 ucWz2SKUjSu6uxApdpmimZCW+QYMXWzyRDie9BqkS7MQqvjomWWjTPai7XPsb9dz5H
 GiEHOyRbPyaJeTiTypPO5sInn/gl0AlTZis2epJMGlFBS8qolN9Vd6agVHEXXgB8yc
 S+xPNerFhya2VHxRRvu4+osKO+VUq/L3YVEfB0+dgHcHMQVEmUhWOSVazLM0oKYX2L
 ifiowaQajQmZWP0Bd502j8FbmyFEidGLM7zZFmoWqb5aoeTe8c1lGK2qtFZZ/60mQE
 ZZH80VTtUgS6w==
Message-ID: <d808df62-1cbf-dcb8-ad15-837dd2b715bb@collabora.com>
Date: Mon, 18 Sep 2023 11:06:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 01/11] soc: mediatek: Add register definitions for GCE
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230918084207.23604-1-shawn.sung@mediatek.com>
 <20230918084207.23604-2-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230918084207.23604-2-shawn.sung@mediatek.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/09/23 10:41, Hsiao Chien Sung ha scritto:
> Add register definitions for GCE so users can use them
> as a buffer to store data.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

