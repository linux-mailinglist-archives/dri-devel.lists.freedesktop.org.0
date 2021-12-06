Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C325469590
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 13:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C16473D6C;
	Mon,  6 Dec 2021 12:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1630 seconds by postgrey-1.36 at gabe;
 Mon, 06 Dec 2021 12:20:15 UTC
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF03173D0E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 12:20:15 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D790C396; Mon,  6 Dec 2021 13:20:13 +0100 (CET)
Date: Mon, 6 Dec 2021 13:20:02 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/9] gpu: host1x: Add missing DMA API include
Message-ID: <Ya3/8mlWkBZiGi7m@8bytes.org>
References: <cover.1637671820.git.robin.murphy@arm.com>
 <d7bc49bfda25a7ea19dc574f8e212cd9e42bf2e2.1637671820.git.robin.murphy@arm.com>
 <0dfb2ee7-e6ec-f085-ed16-650e646d24d7@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dfb2ee7-e6ec-f085-ed16-650e646d24d7@arm.com>
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
 Mikko Perttunen <mperttunen@nvidia.com>, iommu@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>, willy@infradead.org,
 linux-tegra@vger.kernel.org, will@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robin,

On Wed, Nov 24, 2021 at 02:05:15PM +0000, Robin Murphy wrote:
> Bah, seems like tegra-vic needs the same treatment too, but wasn't in my
> local config. Should I squash that into a respin of this patch on the
> grounds of being vaguely related, or would you prefer it separate?

In case this fix gets queued in the iommu-tree too, please put it all in
one patch.

Thanks,

	Joerg
