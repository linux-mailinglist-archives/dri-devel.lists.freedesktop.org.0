Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 639AE25F364
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 08:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82AF6E0DE;
	Mon,  7 Sep 2020 06:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546C86E0DE
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 06:48:14 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB22721556;
 Mon,  7 Sep 2020 06:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599461293;
 bh=ufd2DLX/R0fujTE90EimxEtnJx1MNLG4uLbfR18pQJg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yWMxjEhH/R/l9+Xyly2DPiIo5+q/7J6aYd1yKFNFHuPDKJI6kvtm7mbZmTEHLsSRB
 JN62ad9/7FTEHmTb0FtvLPFf6G64wWTfFeG2uk58dyydGbtw8VJ+3BCPfdVBznbIlW
 d9znNPAZnChcisz9u1FWOUz0fbBhysr6JGhncQww=
Date: Mon, 7 Sep 2020 08:48:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v1 1/2] video: fbdev: aty:
 radeon_pm: remove redundant CONFIG_PM container
Message-ID: <20200907064810.GB284261@kroah.com>
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
 <20200806072658.592444-1-vaibhavgupta40@gmail.com>
 <20200806072658.592444-2-vaibhavgupta40@gmail.com>
 <20200907063347.GB29062@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907063347.GB29062@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bjorn@helgaas.com>, Thierry Reding <thierry.reding@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thierry Reding <treding@nvidia.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 07, 2020 at 12:03:47PM +0530, Vaibhav Gupta wrote:
> 

Why did you send empty emails out?

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
