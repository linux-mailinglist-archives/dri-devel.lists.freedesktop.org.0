Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1285A7FBAB1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:01:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E62E10E512;
	Tue, 28 Nov 2023 13:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB3110E50A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 13:00:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E498EB8399D;
 Tue, 28 Nov 2023 13:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E407EC433C7;
 Tue, 28 Nov 2023 13:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701176455;
 bh=hJBdeKQ+RZ6xDdb/WPig3f/tNF0FMweb3romdDHpWBo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Sq32Bh4AVEfRR2OVKWMCO0yrVJTPJIEEtqJwC9dD6hCKullwIfHzvyp+HgVX4P0Rr
 lCaSweHfCoE0O9QnuxoMufE4qHnS4o8JRJss3dYryMwqQTZviZifAx+KuvBHIRFhxU
 fOnESc9vCIpONw+HjD6npmR4ZMdNk8fuIIg4v9pHBe8MF1KMs9GHkLMyCH38LvBhAe
 yARuYpj6DFiEKyQ1Pteb2IqNjtjIvmx0WoK9X6x4FHQT9svH+f/UapU+8v3xPWBh85
 Nm49HO5USXLe8csiMIFty3aYjvpOqnlBSR8v1ysvugpxIY/apdA+Ya8msCn3yJO9tw
 X56CjZqfDhueQ==
From: Maxime Ripard <mripard@kernel.org>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de, 
 Yang Li <yang.lee@linux.alibaba.com>
In-Reply-To: <20231127010430.119666-1-yang.lee@linux.alibaba.com>
References: <20231127010430.119666-1-yang.lee@linux.alibaba.com>
Subject: Re: (subset) [PATCH -next] drm/imagination: Remove unneeded semicolon
Message-Id: <170117645284.2825698.5291536239401902497.b4-ty@kernel.org>
Date: Tue, 28 Nov 2023 14:00:52 +0100
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
Cc: Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, matt.coster@imgtec.com,
 donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Nov 2023 09:04:30 +0800, Yang Li wrote:
> ./drivers/gpu/drm/imagination/pvr_free_list.c:258:2-3: Unneeded semicolon
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

