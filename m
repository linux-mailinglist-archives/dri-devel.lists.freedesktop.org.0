Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 463CEB40543
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 15:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F56610E72F;
	Tue,  2 Sep 2025 13:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qEf1MwSM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCF010E72C;
 Tue,  2 Sep 2025 13:51:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9DDE360212;
 Tue,  2 Sep 2025 13:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7FDC4CEED;
 Tue,  2 Sep 2025 13:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756821082;
 bh=fzLIkjf13oqOrd9WScq2CantRkcwIt9xJt+QxtYtrfk=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=qEf1MwSMuq+W4iJ3Bdq7vDcaBoQHSuFhKUn5fCh/9K6QmK07O67h6V4KdMqVQweXY
 R/ZyKAuR2+0SxCMBZTpWlxtFVYgjVG6lqDtCEJTRds+u2d5Evdb8AS+HGGXdRYuw0+
 SVqaLnDNosakssraywfALd6o7N1+e8vH+iaTAr0iZxgXoZVGx43/HmZcdTeKsRViM5
 RxAiJIXsterIbbfO790pqPRwcxRw9hR+uEvRginoleGRyp4TyV0Fq3hqrSZdMqIzmM
 T316KwEcn3nq/7WU53CO1goNUcN473iCa2TeYVLwkJ6yvn9WEy8M9RsbLrwjnjT/x1
 E8kOxKTl0VWWw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Sep 2025 15:51:18 +0200
Message-Id: <DCID3HS7BBSY.244VUJMOWACV8@kernel.org>
To: "James Jones" <jajones@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update git entry for nouveau
Cc: "Lyude Paul" <lyude@redhat.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, "LKML" <linux-kernel@vger.kernel.org>
References: <20250826195716.1897-1-jajones@nvidia.com>
In-Reply-To: <20250826195716.1897-1-jajones@nvidia.com>
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

On Tue Aug 26, 2025 at 9:57 PM CEST, James Jones wrote:
> The gitlab repository previously associated with
> the nouveau module has fallen out of use. The
> drm-misc tree here:
>
> https://gitlab.freedesktop.org/drm/misc/kernel.git
>
> Is now where most nouveau-related patches are
> applied. This change updates the MAINTAINERS file
> to reflect this.
>
> Signed-off-by: James Jones <jajones@nvidia.com>

Applied to drm-misc-fixes, thanks!
