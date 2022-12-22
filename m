Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C10653D9D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 10:43:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0447810E538;
	Thu, 22 Dec 2022 09:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B344410E533
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 09:43:14 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 02E88600877F;
 Thu, 22 Dec 2022 09:42:34 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id iG2wuaXYaeqi; Thu, 22 Dec 2022 09:42:31 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id C6A30600877B;
 Thu, 22 Dec 2022 09:42:30 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1671702151;
 bh=+NcjhbdWRVou5QHBVIRCejY4JUQXV0259TVu5+bQdmI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=gEHd8R4sXKnYFMG3qPhYTD0fCmkVgGjcaWhVUDD3x8IQ7HhwlyVXFFZ1R8MC0VivV
 qNg1AF5KKMwtq8Ru0Hj5orRDRNoBoh0731XnT2ixgopXovdnCVpDTLQNldaDxPbBeP
 Geczbrft6q7D2tXXoKnANTtdpB6eKQ442wdagJJk=
Received: from wslaptop (unknown [IPv6:2001:8a0:fbe7:6700:65be:d034:d2ec:60ff])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 56B5B360083;
 Thu, 22 Dec 2022 09:42:29 +0000 (WET)
Date: Thu, 22 Dec 2022 09:41:08 +0000
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: diogo.ivo@tecnico.ulisboa.pt
Subject: Re: [PATCH v2 RESEND 0/4] Add JDI LPM102A188A display panel support
Message-ID: <20221222094108.vfpyi4jrleuq6yqc@wslaptop>
References: <20221128162851.110611-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128162851.110611-1-diogo.ivo@tecnico.ulisboa.pt>
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-tegra@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 28, 2022 at 04:28:48PM +0000, Diogo Ivo wrote:
> Hello,
> 
> These patches add support for the JDI LPM102A188A display panel,
> found in the Google Pixel C.

Hello,

Gentle ping on this series.

Thank you,

Diogo Ivo
