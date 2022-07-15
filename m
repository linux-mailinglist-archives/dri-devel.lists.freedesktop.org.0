Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62375576F44
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4013E1122F0;
	Sat, 16 Jul 2022 14:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5.hostedemail.com (smtprelay0010.hostedemail.com
 [216.40.44.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C1B10E153
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 22:16:16 +0000 (UTC)
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay12.hostedemail.com (Postfix) with ESMTP id 358A512095E;
 Fri, 15 Jul 2022 22:16:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf13.hostedemail.com (Postfix) with ESMTPA id 01E912000D; 
 Fri, 15 Jul 2022 22:16:05 +0000 (UTC)
Message-ID: <f6ab40860cd4f8079e6e169c7d6465f211b8dbd3.camel@perches.com>
Subject: Re: [PATCH v2 24/39] drm/i915: dvo_sil164.c: use SPDX header
From: Joe Perches <joe@perches.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Date: Fri, 15 Jul 2022 15:16:05 -0700
In-Reply-To: <YtHdp6ju3IfjF8Bq@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <002a8d51244a70572744de86cacbdae293e7d503.1657699522.git.mchehab@kernel.org>
 <YtHdp6ju3IfjF8Bq@intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Stat-Signature: 9shq7dagh5qa1dpwkohcwaxcpnds4xbk
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 01E912000D
X-Spam-Status: No, score=-1.84
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19aezajI8aTJN8t18DoGrRvtF8w07Xpt2A=
X-HE-Tag: 1657923365-889008
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
Cc: David Airlie <airlied@linux.ie>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-07-15 at 17:35 -0400, Rodrigo Vivi wrote:
> On Wed, Jul 13, 2022 at 09:12:12AM +0100, Mauro Carvalho Chehab wrote:
> > This file is licensed with MIT license.	Change its license text
> > to use SPDX.
> >=20
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>=20
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Not exactly the MIT license as it's missing "or copyright holders"
>=20
> > ---
> >=20
> > To avoid mailbombing on a large number of people, only mailing lists we=
re C/C on the cover.
> > See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.g=
it.mchehab@kernel.org/
> >=20
> >  drivers/gpu/drm/i915/display/dvo_sil164.c | 32 +++++------------------
> >  1 file changed, 6 insertions(+), 26 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/dvo_sil164.c b/drivers/gpu/dr=
m/i915/display/dvo_sil164.c
> > index 0dfa0a0209ff..12974f7c9dc1 100644
> > --- a/drivers/gpu/drm/i915/display/dvo_sil164.c
> > +++ b/drivers/gpu/drm/i915/display/dvo_sil164.c
> > @@ -1,30 +1,10 @@
> > -/*********************************************************************=
*****
> > +// SPDX-License-Identifier: MIT
> > =20
> > -Copyright =A9 2006 Dave Airlie
> > -
> > -All Rights Reserved.
> > -
> > -Permission is hereby granted, free of charge, to any person obtaining =
a
> > -copy of this software and associated documentation files (the
> > -"Software"), to deal in the Software without restriction, including
> > -without limitation the rights to use, copy, modify, merge, publish,
> > -distribute, sub license, and/or sell copies of the Software, and to
> > -permit persons to whom the Software is furnished to do so, subject to
> > -the following conditions:
> > -
> > -The above copyright notice and this permission notice (including the
> > -next paragraph) shall be included in all copies or substantial portion=
s
> > -of the Software.
> > -
> > -THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S
> > -OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > -MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT=
.
> > -IN NO EVENT SHALL THE AUTHOR

Missing "Authors or copyright holders"

> > BE LIABLE FOR
> > -ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRAC=
T,
> > -TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> > -SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> > -
> > -**********************************************************************=
****/
> > +/*
> > + * Copyright =A9 2006 Dave Airlie
> > + *
> > + * All Rights Reserved.
> > + */
> > =20
> >  #include "intel_display_types.h"
> >  #include "intel_dvo_dev.h"
> > --=20
> > 2.36.1
> >=20

