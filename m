Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD55C809F8E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 10:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CB810EA3B;
	Fri,  8 Dec 2023 09:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F9B10EA37
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 09:36:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0C580CE213F;
 Fri,  8 Dec 2023 09:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBC9C433C7;
 Fri,  8 Dec 2023 09:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702028181;
 bh=1CQCQuBN6PFcxmLhiFIbMd1M4H+gvuAWd2IXv5gTkJs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=iQV1KpsY+O0VGaqLhE++yuEtiaCmhiZb35CNR7bHrrLtJcGtXfWxpn1Oo1aoxuIYy
 doSNdfQa/yrvMxmf+bZxAH1Pfn5+gBBdHEax/TE3K8pSp7kVoCKTRsza/Thk+e6/pv
 Wq3Zv4Twz6VBKFLBZie1s7Sc7Hux3Et5n8H63EKy8c1uQ2j8Id8+ekeQIOchjCMMBA
 VugoTLzbc9I19GIjIxg8lFUsQ8tUI3oajVbwXytiJ/iiVjBTgsTrTqWdzfu0Y9oLNZ
 ZHpgvJXgfio2JDICwavJ0N++uhiBdWI31hpEPNcdPLbGeAqkMIkcCB1Xk2NShDWI+R
 WvgUB1YUBrz5A==
From: Maxime Ripard <mripard@kernel.org>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de, 
 Yang Li <yang.lee@linux.alibaba.com>
In-Reply-To: <20231208003034.68339-1-yang.lee@linux.alibaba.com>
References: <20231208003034.68339-1-yang.lee@linux.alibaba.com>
Subject: Re: (subset) [PATCH -next] drm/imagination: Remove unneeded semicolon
Message-Id: <170202817893.16687.13304658818752045049.b4-ty@kernel.org>
Date: Fri, 08 Dec 2023 10:36:18 +0100
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abaci Robot <abaci@linux.alibaba.com>, matt.coster@imgtec.com,
 donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 08 Dec 2023 08:30:34 +0800, Yang Li wrote:
> ./drivers/gpu/drm/imagination/pvr_fw_trace.c:251:2-3: Unneeded semicolon
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

