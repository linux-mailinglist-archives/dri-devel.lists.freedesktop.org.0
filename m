Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA638568B0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 17:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10BE10E9A1;
	Thu, 15 Feb 2024 16:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Gh8y4J4W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729B010E9A1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 16:03:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 56CE0CE23F0;
 Thu, 15 Feb 2024 16:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D5FC433C7;
 Thu, 15 Feb 2024 16:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708012979;
 bh=LIu2ftgfgDnm4yLR9EGjnqhVdVgGtxweSCzm0qeHe+8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Gh8y4J4WSklsO9cCgrK7dWDV09e/sLTQd5dWl869DfXporGPp2ZtWm4t1U1xc8TxT
 ifZz7Sa7OHXjhNTrdoF6N4mtv2OCYpxZbHLgK/keOe3lcOHuj9sxxXfm3LWEdgLkzU
 M3LVi/OC0WN4AgwSEtsWSxTObQO73/6U/h+jxzrxyW3qUdSrlyyrkqx9mG/3eDZ4zP
 H03dFAcIAq/KM8l3U/4zDKnUjnrCGh9arMAr6w3dLn1s60ToB6d7orDwcEFVpWIw9r
 FyYEUaShbs2VD2Qv0Y5QQLizKDFRAMwg4Prd9NaI/Oi6es9kY3txP9stS8r33EeJb2
 5EV+HNc2WQOOQ==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <94c9b76ee906d1b790dfcc435f4221b1197df586.1708003402.git.geert+renesas@glider.be>
References: <94c9b76ee906d1b790dfcc435f4221b1197df586.1708003402.git.geert+renesas@glider.be>
Subject: Re: (subset) [PATCH v2] drm: Spelling s/hardward/hardware/g
Message-Id: <170801297623.1530193.16390570241474104331.b4-ty@kernel.org>
Date: Thu, 15 Feb 2024 17:02:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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

On Thu, 15 Feb 2024 14:24:15 +0100, Geert Uytterhoeven wrote:
> Fix misspellings of "hardware".
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

