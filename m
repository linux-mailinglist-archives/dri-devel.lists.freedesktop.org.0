Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA3B293803
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 11:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76266EC52;
	Tue, 20 Oct 2020 09:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8C76EC2E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 09:30:23 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3D2772002A;
 Tue, 20 Oct 2020 11:30:21 +0200 (CEST)
Date: Tue, 20 Oct 2020 11:30:19 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: It appears drm-next TTM cleanup broke something . . .
Message-ID: <20201020093019.GA1791118@ravnborg.org>
References: <trinity-7bf82d9f-a022-48f3-bca0-d06eb28ebe35-1603048517864@3c-app-mailcom-bs08>
 <20201018210412.GA515543@ravnborg.org>
 <trinity-a0f09460-7d25-457a-aef8-e70fcf617a83-1603136588694@3c-app-mailcom-bs01>
 <20201019202830.GA1484408@ravnborg.org>
 <8d4c5209-e429-628b-394d-161cc14811d1@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8d4c5209-e429-628b-394d-161cc14811d1@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=S433PrkP c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=VssMyIbL3CLq3DsjQ9gA:9
 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 Kevin Brace <kevinbrace@gmx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

> I'd be interested in this as well. If you could share an URL to the
> repo, I'd take a look. I think I even have a Via machine somewhere to
> give it a try.

You can find it here:
git://anongit.freedesktop.org/openchrome/drm-openchrome

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
