Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D335C72605C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 15:03:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BE010E4F8;
	Wed,  7 Jun 2023 13:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C714510E4F8
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 13:03:07 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0F09E6606EE3;
 Wed,  7 Jun 2023 14:03:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686142985;
 bh=e/TcWFexSS25/QSsY9FatNi134IkwCf8Y7dHuRcIocg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KffaGIX3FUVzJn+TLieenNkbY5jnFEe19rKkfLMYwaGhlVoXxgcxJS2jBiDk8FmUy
 261nWSAuRok8BXocS3sGxGsgBGUix9PYASYlvfSEeyiSVAllZVwVXWipAepRAWukSh
 0xRPzjsq+djj6eIHoRCOSwK4Ghf3YDj8yrD/Y9UvoC/jQm9M1HtYY4HNrw2C6BffYI
 lZVF90VJjNu2+SSLi+4o3mS7Wv+zIaIjvFhQg0FjxXo+Y5oIto26X/dQxNahQSkJIx
 P+VgpkW0T+7V5jZ0POjZc+UM4Qq66WGedcMBQUun0wWXs/7cNbB+W/aTBy11fBl+6p
 Dmho7pr4TdFlA==
Message-ID: <a1a2ca75-f542-47f6-19ea-5e96b8894632@collabora.com>
Date: Wed, 7 Jun 2023 15:03:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] drm/panel-edp: Add AUO B116XAB01.4 edp panel entry
To: Laura Nao <laura.nao@collabora.com>,
 Douglas Anderson <dianders@chromium.org>
References: <20230607102123.219862-1-laura.nao@collabora.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230607102123.219862-1-laura.nao@collabora.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 07/06/23 12:21, Laura Nao ha scritto:
> Add a panel entry for the AUO B116XAB01.4 edp panel, found in the Acer
> Chromebook Spin 311 (CP311-3H) laptop.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

