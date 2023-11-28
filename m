Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDA47FC0E6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 18:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9A610E2FB;
	Tue, 28 Nov 2023 17:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BAC10E2FB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 17:57:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8B4EE61865;
 Tue, 28 Nov 2023 17:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC732C433C8;
 Tue, 28 Nov 2023 17:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701194267;
 bh=NGmfjNMsc8MTcobjGt/SD7zw/1t1pkX0VqePmSopdm8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dTXC6egirGlbMaSupo1pofhXHH5Crhtyt5gOzv2fhTahh0xcxufVmu0fr68m+mfxy
 45npWDLjm4Kh1nFDmMF5KyDrkqAGX5Y/FlKV0HjtF+qhvV/TicDBj/Ze5vbBwmaZ/a
 UJw+D9Eadpcr3FsNSqU6tc1nDWgsje64YqJxnK5HhceN4tzGlzZ1gGTmaLhJWLxOSO
 fyySka2RHYSHWEwd4tli8vA6eBamVtWoRb8vTtjUAJ+mxmqcARrBJy+fD5EX2rztTQ
 8qHq6rqWgbEWFDaRrrCBdO2ebnc2kRhRex4FgnQLrc8PB1GBJeIjA5MB9u4IAqj7a6
 YMQukS9DakoGQ==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Donald Robson <donald.robson@imgtec.com>
In-Reply-To: <20231128173507.95119-1-donald.robson@imgtec.com>
References: <20231128173507.95119-1-donald.robson@imgtec.com>
Subject: Re: (subset) [PATCH] drm/imagination: Numerous documentation
 fixes.
Message-Id: <170119426454.2880479.7880420344825217508.b4-ty@kernel.org>
Date: Tue, 28 Nov 2023 18:57:44 +0100
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, tzimmermann@suse.de,
 corbet@lwn.net, matt.coster@imgtec.com, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Nov 2023 17:35:07 +0000, Donald Robson wrote:
> Some reported by Stephen Rothwell. The rest were found by running the
> kernel-doc build script.
> Some indentation fixes.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

