Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC5B755E80
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 10:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1206E10E206;
	Mon, 17 Jul 2023 08:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44AB610E206
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:31:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A93A760FCC;
 Mon, 17 Jul 2023 08:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F85C433C7;
 Mon, 17 Jul 2023 08:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689582714;
 bh=Ed4Qa3jBWUrLcAVqoRASDBEf+9RhyoK1rB7ysC+vTls=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=A9nHFACJWNQ0sXmzT/XwBzVXV6dzdAP4JZwR1V/T1CT2N3Ng4THFmYDZbmKsp4iNA
 CsizUytpsjcUfg2RdQp4/ZFYphw8wlZB2f9wid/E6uSaJfJ+gnIc1gFG7QwN+UYrR5
 N3Tnx91uvC8TGXC2kvw/VeGUaCZ7pH5X/yyqziZvl5c5/PEMwPke0u/d4h7eHAq3/I
 Y1t0NAS0Et59T7ESzEOx3bkfGnE6rOktwCrj+QMHwTlvlpnJJZV/hM+sBuGmG0vkuV
 DxaPG5Z5FXphEHOS2nmGK01PsYqYqRCE2xSDN4smYjlooGiycuXhYVJBUShRtaf3bN
 XbCVZVonS021g==
Message-ID: <018cf2e0625710135918392df7479026.mripard@kernel.org>
Date: Mon, 17 Jul 2023 08:31:51 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Sarah Walker" <sarah.walker@imgtec.com>
Subject: Re: [PATCH v4 16/17] drm/imagination: Add driver documentation
In-Reply-To: <20230714143015.112562-1-sarah.walker@imgtec.com>
References: <20230714143015.112562-1-sarah.walker@imgtec.com>
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, mripard@kernel.org,
 tzimmermann@suse.de, corbet@lwn.net, hns@goldelico.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, afd@ti.com, boris.brezillon@collabora.com,
 dakr@redhat.com, donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Jul 2023 15:30:15 +0100, Sarah Walker wrote:
> Add documentation for the UAPI and for the virtual memory design.
> 
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
