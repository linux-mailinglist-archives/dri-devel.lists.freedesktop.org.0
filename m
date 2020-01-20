Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1CC1432DA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 21:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAA56EB10;
	Mon, 20 Jan 2020 20:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E576EB10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 20:21:35 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B005720028;
 Mon, 20 Jan 2020 21:21:30 +0100 (CET)
Date: Mon, 20 Jan 2020 21:21:29 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Subject: Re: [PATCH v2] drm: fix parameters documentation style
Message-ID: <20200120202129.GB17555@ravnborg.org>
References: <20200114160135.14990-1-benjamin.gaignard@st.com>
 <20200118094156.GB12245@ravnborg.org>
 <372573cc-b0ae-72cb-f2c3-3f9310c3cf27@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <372573cc-b0ae-72cb-f2c3-3f9310c3cf27@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=8b9GpE9nAAAA:8
 a=lKaM5KJSvNEHRUbUXN8A:9 a=wPNLvfGTeEIA:10 a=T3LWEMljR5ZiDmsYVIUa:22
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Benjamin.

On Mon, Jan 20, 2020 at 08:11:01AM +0000, Benjamin GAIGNARD wrote:
> =

> On 1/18/20 10:41 AM, Sam Ravnborg wrote:
> > Hi Benjamin
> >
> > On Tue, Jan 14, 2020 at 05:01:35PM +0100, Benjamin Gaignard wrote:
> >> Remove old documentation style and use new one to avoid warnings when
> >> compiling with W=3D1
> >>
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> > Thanks for the warning fixes.
> > This is legacy stuff that is not even wired into the kernel-doc stuff.
> > But that is no excuse for old-style comments.
> =

> There is still quite a few of them in other drm files (drm_context.c,=A0 =

> drm_bufs.c, drm_vm.c, drm_lock.c)
> =

> but I don't know how to fix them. Your advices are welcome.

I have no strong opinion on way forward here.
But if someone (you?) type the patches and they are even acked,
we should not ignore them.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
