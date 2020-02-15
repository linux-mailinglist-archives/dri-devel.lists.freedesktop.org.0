Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8C315FFB7
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2020 19:39:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814546E8FD;
	Sat, 15 Feb 2020 18:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D188D6E8FD
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 18:39:30 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id E856F20021;
 Sat, 15 Feb 2020 19:39:26 +0100 (CET)
Date: Sat, 15 Feb 2020 19:39:25 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Emmanuel Vadot <manu@FreeBSD.org>
Subject: Re: [PATCH v2 0/2] Dual licence some files in GPL-2.0 and MIT
Message-ID: <20200215183925.GB17310@ravnborg.org>
References: <20200215180911.18299-1-manu@FreeBSD.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200215180911.18299-1-manu@FreeBSD.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8
 a=NKQpwnPXBcL0xclLFCIA:9 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
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
Cc: tzimmermann@suse.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, efremov@linux.com, jani.nikula@intel.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emmanuel.

On Sat, Feb 15, 2020 at 07:09:09PM +0100, Emmanuel Vadot wrote:
> Hello all,
> =

> We had a discussion a while back with Noralf where he said that he wouldn=
't
> mind dual licence his work under GPL-2 and MIT.
> Those files are a problem with BSDs as we cannot include them.
> For drm_client.c the main contributors are Noralf Tr=F8nnes and Thomas
> Zimmermann, the other commits are just catch ups from changes elsewhere
> (return values, struct member names, function renames etc ...).
> For drm_format_helper the main contributors are Noralf Tr=F8nnes and
> Gerd Hoffmann. Same comment as for drm_client.c for the other commits.
> =

> Emmanuel Vadot (2):
>   drm/client: Dual licence the file in GPL-2 and MIT
>   drm/format_helper: Dual licence the file in GPL 2 and MIT
> =

>  drivers/gpu/drm/drm_client.c        | 2 +-
>  drivers/gpu/drm/drm_format_helper.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I have made a minimal change to drm_client.c
Therefore my acks count only for a very little - but here it is:
Acked-by: Sam Ravnborg <sam@ravnborg.org> [for my drm_client.c edits]


	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
