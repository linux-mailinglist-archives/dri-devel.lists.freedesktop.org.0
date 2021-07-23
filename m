Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F89C3D3CD4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 17:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A496EA11;
	Fri, 23 Jul 2021 15:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id EEF0D6E9E1;
 Fri, 23 Jul 2021 15:52:31 +0000 (UTC)
Received: from [192.168.0.2] (188-167-68-178.dynamic.chello.sk
 [188.167.68.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id 1A1C57A003B;
 Fri, 23 Jul 2021 17:52:31 +0200 (CEST)
From: Ondrej Zary <linux@zary.sk>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Nouveau] nouveau broken again on Riva TNT2 in 5.14.0-rc2
Date: Fri, 23 Jul 2021 17:52:28 +0200
User-Agent: KMail/1.9.10
References: <202107222122.05546.linux@zary.sk>
 <CACO55tvq0Ksm6x_L3r6B8KhYR6dTqb=xzPaRzAeQgaBnff_sYA@mail.gmail.com>
 <CAKMK7uGee+A2hzY8meXnBAWDuQGs=c=3oww8-JxMJWxF8_kR=A@mail.gmail.com>
In-Reply-To: <CAKMK7uGee+A2hzY8meXnBAWDuQGs=c=3oww8-JxMJWxF8_kR=A@mail.gmail.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202107231752.28531.linux@zary.sk>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday 23 July 2021 09:26:10 Daniel Vetter wrote:
> On Thu, Jul 22, 2021 at 9:51 PM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > hey thanks for the report.
> >
> > This is a known issue and the fix is pending in drm-mist-fixes and
> > should land in 5.14 soonish.
> 
> It just landed in Linus' tree yesterday, please retest that or -rc3.
> If it's still broken it's something else.
> -Daniel

Thanks, it works!

-- 
Ondrej Zary
