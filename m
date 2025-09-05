Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DDDB45121
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 10:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C8F10E2C8;
	Fri,  5 Sep 2025 08:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GjPcgtFl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CEF10E2C8
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 08:18:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ED58D40063;
 Fri,  5 Sep 2025 08:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3B4C4CEF1;
 Fri,  5 Sep 2025 08:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757060316;
 bh=3wk8a+bIggfZCsBMSScJxPqeod2bkxkOOu/xeePXKrk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GjPcgtFlOi6WtfNtIwSvFSk3c9z+w8/0Hc4MJivYNhfDzDC+eYLrIv4ZNo34k4eY8
 5ht4IKTV8iv7YfK0eT683kvOapKkdyk7djEUhkNMevsDv9Y4t2nCP1R5zrd9/585RZ
 HPdZljbk7Ooa+upSTmWDKlxRgdN662Bwss0Exr1NGPiJwHoFs/Jj9B45oqKiUZqVtD
 HPlfL0Ojy7I1D5LAlzkYBh32nWFinRdqysw/svAAZHvFeNSyehuV3iDAqDLhPPAPjO
 a8eTfO4D5XuHFOTdeuQHRfWl+sc2EiFqKJX8aiZ7gtrZsX+M0k96b9LRON6jWRyB/2
 +19v4q8ARIfqA==
Date: Fri, 5 Sep 2025 10:18:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: ili9881c: Document 5" Raspberry Pi
 720x1280
Message-ID: <20250905-classic-hairy-camel-44847f@kuoka>
References: <20250904205743.186177-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250904205743.186177-1-marek.vasut+renesas@mailbox.org>
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

On Thu, Sep 04, 2025 at 10:56:56PM +0200, Marek Vasut wrote:
> Document the 5" Raspberry Pi 720x1280 DSI panel based on ili9881.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

