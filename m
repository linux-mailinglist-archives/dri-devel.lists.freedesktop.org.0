Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 798EA245F78
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 10:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C6E6E4F3;
	Mon, 17 Aug 2020 08:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625E56E532
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 08:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id ED0F3FB03;
 Mon, 17 Aug 2020 10:22:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vsj6xPO_wWQO; Mon, 17 Aug 2020 10:22:05 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 683F14576F; Mon, 17 Aug 2020 10:22:05 +0200 (CEST)
Date: Mon, 17 Aug 2020 10:22:05 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/2] Modernize rocktech,jh057n00900 bindings a bit
Message-ID: <20200817082205.GA31233@bogon.m.sigxcpu.org>
References: <cover.1597561897.git.agx@sigxcpu.org>
 <20200816152534.GB1394979@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200816152534.GB1394979@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Sun, Aug 16, 2020 at 05:25:34PM +0200, Sam Ravnborg wrote:
> Hi Guido.
> =

> On Sun, Aug 16, 2020 at 09:13:41AM +0200, Guido G=FCnther wrote:
> > This was prompted by Sam's review in
> > https://lore.kernel.org/dri-devel/20200815210802.GA1242831@ravnborg.org/
> > and yamllint. I also added myself as maintainer, hope that's o.k.
> > =

> > Guido G=FCnther (2):
> >   dt-bindings: panel: rocktech,jh057n00900: Modernize
> >   dt-bindings: panel: rocktech,jh057n00900: Add myself as maintainer
> =

> Thanks for this nice clean-up, and always good with an extra person
> caring for something.
> Applied to drm-misc-next

Thanks!
 -- Guido

> =

> 	Sam
> =

> > =

> >  .../display/panel/rocktech,jh057n00900.yaml   | 40 +++++++++----------
> >  1 file changed, 19 insertions(+), 21 deletions(-)
> > =

> > -- =

> > 2.26.2
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
