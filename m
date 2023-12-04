Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FB98035AE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 14:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A2810E1D1;
	Mon,  4 Dec 2023 13:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F8210E1D1
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 13:57:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 841BC61177;
 Mon,  4 Dec 2023 13:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C03C433C8;
 Mon,  4 Dec 2023 13:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701698236;
 bh=P61qJT7k6TtCOcd2ljpk3rt4h0DdkrkYLDxklJ+6th4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kFy3SNdFk/IecCWU/k9jrIllvNd4aYD8qAEhXYvdFJJ4lXo1METiaJvuddcv96/zB
 ZIHdJxRQSXQpnJzB4JuANAyxZIXNN05m+FlUJva4Y2FqTXq07Wu0SLYqi+Cq7UWd9p
 /xutoEFpB7pORUXVaFLJaq30WM+4xG7c/fqk1o98f2d96ZGNbUgGMW9aDseiPCnx9U
 jRYbPPvch+KEkFnbH0kAb4ukvE8EjQR2fzYF3XwUr9teB6TIA+rXb6r0zxOdJSuP8T
 DMjqk9enOL+klccrAWdXtjO6A+Xul2Mb0tiQ23Oepcgg5zWYWpRMKC+YNuQvGQhx6X
 m2p7SxIgeUQUQ==
From: Maxime Ripard <mripard@kernel.org>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Frank Binns <frank.binns@imgtec.com>
In-Reply-To: <20231204132847.1307340-1-frank.binns@imgtec.com>
References: <20231204132847.1307340-1-frank.binns@imgtec.com>
Subject: Re: (subset) [PATCH] MAINTAINERS: Document Imagination PowerVR
 driver patches go via drm-misc
Message-Id: <170169823361.9852.12738363315803901923.b4-ty@kernel.org>
Date: Mon, 04 Dec 2023 14:57:13 +0100
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
Cc: matt.coster@imgtec.com, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 04 Dec 2023 13:28:47 +0000, Frank Binns wrote:
> This is the tree used by nearly all other DRM drivers, so use it for the
> PowerVR driver as well.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

