Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DF91701F6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 16:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3476E2D6;
	Wed, 26 Feb 2020 15:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C166E2D6;
 Wed, 26 Feb 2020 15:08:32 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2020 07:08:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,488,1574150400"; d="scan'208";a="350409339"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 26 Feb 2020 07:08:20 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 26 Feb 2020 17:08:19 +0200
Date: Wed, 26 Feb 2020 17:08:19 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: 
Message-ID: <20200226150819.GK13686@intel.com>
References: <86d0ec$ae4ffc@fmsmga001.fm.intel.com>
 <CACRpkdZ4H5fdWsxsXnsbyxb6fwKbgm0h5a6CdqEjU9w5+z0a7Q@mail.gmail.com>
 <20200226143409.GJ13686@intel.com>
 <CACRpkdZSapEh3sCqGjpnOuX-vbf1C=AjzN7Ryu2v6V5npoWgoA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZSapEh3sCqGjpnOuX-vbf1C=AjzN7Ryu2v6V5npoWgoA@mail.gmail.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Josh Wu <josh.wu@atmel.com>,
 Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>,
 Neil Armstrong <narmstrong@baylibre.com>, nouveau@lists.freedesktop.org,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Paul Kocialkowski <contact@paulk.fr>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Gustaf =?iso-8859-1?Q?Lindstr=F6m?= <gl@axentia.se>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Jonathan Marek <jonathan@marek.ca>,
 Stefan Mavrodiev <stefan@olimex.com>, Adam Ford <aford173@gmail.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Robert Chiras <robert.chiras@nxp.com>, Heiko Schocher <hs@denx.de>,
 Icenowy Zheng <icenowy@aosc.io>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Vincent Abriou <vincent.abriou@st.com>, Andreas Pretzsch <apr@cn-eng.de>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Alex Gonzalez <alex.gonzalez@digi.com>, Purism Kernel Team <kernel@puri.sm>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 03:56:36PM +0100, Linus Walleij wrote:
> On Wed, Feb 26, 2020 at 3:34 PM Ville Syrj=E4l=E4
> <ville.syrjala@linux.intel.com> wrote:
> > On Wed, Feb 26, 2020 at 01:08:06PM +0100, Linus Walleij wrote:
> > > On Wed, Feb 26, 2020 at 12:57 PM Ville Syrj=E4l=E4
> > > <ville.syrjala@linux.intel.com> wrote:
> > > > On Tue, Feb 25, 2020 at 10:52:25PM +0100, Linus Walleij wrote:
> > >
> > > > > I have long suspected that a whole bunch of the "simple" displays
> > > > > are not simple but contains a display controller and memory.
> > > > > That means that the speed over the link to the display and
> > > > > actual refresh rate on the actual display is asymmetric because
> > > > > well we are just updating a RAM, the resolution just limits how
> > > > > much data we are sending, the clock limits the speed on the
> > > > > bus over to the RAM on the other side.
> > > >
> > > > IMO even in command mode mode->clock should probably be the actual
> > > > dotclock used by the display. If there's another clock for the bus
> > > > speed/etc. it should be stored somewhere else.
> > >
> > > Good point. For the DSI panels we have the field hs_rate
> > > for the HS clock in struct mipi_dsi_device which is based
> > > on exactly this reasoning. And that is what I actually use for
> > > setting the HS clock.
> > >
> > > The problem is however that we in many cases have so
> > > substandard documentation of these panels that we have
> > > absolutely no idea about the dotclock. Maybe we should
> > > just set it to 0 in these cases?
> >
> > Don't you always have a TE interrupt or something like that
> > available? Could just measure it from that if no better
> > information is available?
> =

> Yes and I did exactly that, so that is why this comment is in
> the driver:
> =

> static const struct drm_display_mode sony_acx424akp_cmd_mode =3D {
> (...)
>         /*
>          * Some desired refresh rate, experiments at the maximum "pixel"
>          * clock speed (HS clock 420 MHz) yields around 117Hz.
>          */
>         .vrefresh =3D 60,
> =

> I got a review comment at the time saying 117 Hz was weird.
> We didn't reach a proper conclusion on this:
> https://lore.kernel.org/dri-devel/CACRpkdYW3YNPSNMY3A44GQn8DqK-n9TLvr7uip=
F7LM_DHZ5=3DLg@mail.gmail.com/
> =

> Thierry wasn't sure if 60Hz was good or not, so I just had to
> go with something.
> =

> We could calculate the resulting pixel clock for ~117 Hz with
> this resolution and put that in the clock field but ... don't know
> what is the best?

I would vote for that approach.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
