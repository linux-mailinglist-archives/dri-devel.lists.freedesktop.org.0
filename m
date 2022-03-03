Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 113CB4CB898
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 09:20:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DD610ED70;
	Thu,  3 Mar 2022 08:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D59410ED70
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 08:20:01 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nPggo-00047v-Ta; Thu, 03 Mar 2022 09:19:58 +0100
Message-ID: <8865c3248d860aefb802ccbc3c486fb6d3721b14.camel@pengutronix.de>
Subject: Re: [PATCH 1/9] dt-bindings: mxsfb: Add compatible for i.MX8MP
From: Lucas Stach <l.stach@pengutronix.de>
To: Liu Ying <victor.liu@oss.nxp.com>, Marek Vasut <marex@denx.de>, Adam
 Ford <aford173@gmail.com>
Date: Thu, 03 Mar 2022 09:19:55 +0100
In-Reply-To: <15a6222b256f67a01ef947bb44a2737a6606ad4c.camel@oss.nxp.com>
References: <20220228004605.367040-1-marex@denx.de>
 <35b981d0d9d763525c427491ca0e25b6e4c03d0f.camel@oss.nxp.com>
 <8eac8a2c-bc6d-0c79-c727-bdaa2cd9abee@denx.de>
 <a3ab4ec2dd0c7b87698bc7902509a4de6950dd25.camel@oss.nxp.com>
 <33207e88-da9b-96d7-0fef-461cb4496c88@denx.de>
 <284d65f53dffb6085bde6ef6ecd398f10d4c6c80.camel@oss.nxp.com>
 <8950434843ff7bbd1a527b0c799d9a74a75ee36d.camel@pengutronix.de>
 <7aeed693-dfb7-950f-fdf0-3c90de285392@denx.de>
 <8bf0b5a1c9ab9faee28077436cdfd49c0cd08792.camel@pengutronix.de>
 <CAHCN7xJ6ypDxZouZV1b1F1EgQFwdTvmY6EEekj+_z-UWbQMD5Q@mail.gmail.com>
 <4253aa4b5dc4a3568e45755678849961468bfd38.camel@pengutronix.de>
 <b655f565-43b2-4e42-953e-d6efa02f0219@denx.de>
 <85af7c5dfa120903a22e5e704e3bddd87830033c.camel@pengutronix.de>
 <049a182d8bf75110dc5ebe72f5b58d209b64d58a.camel@oss.nxp.com>
 <7e0323b120ebd8faef162a9b0f0ab048bdb7a34b.camel@pengutronix.de>
 <15a6222b256f67a01ef947bb44a2737a6606ad4c.camel@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 03.03.2022 um 10:54 +0800 schrieb Liu Ying:
> On Wed, 2022-03-02 at 12:57 +0100, Lucas Stach wrote:
> > Am Mittwoch, dem 02.03.2022 um 17:41 +0800 schrieb Liu Ying:
> > > On Wed, 2022-03-02 at 10:23 +0100, Lucas Stach wrote:
> > > > Am Mittwoch, dem 02.03.2022 um 03:54 +0100 schrieb Marek Vasut:
> > > > > On 3/1/22 14:18, Lucas Stach wrote:
> > > > > > Am Dienstag, dem 01.03.2022 um 07:03 -0600 schrieb Adam Ford:
> > > > > > > On Tue, Mar 1, 2022 at 5:05 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > > > > > > > Am Dienstag, dem 01.03.2022 um 11:19 +0100 schrieb Marek Vasut:
> > > > > > > > > On 3/1/22 11:04, Lucas Stach wrote:
> > > > > > > > > 
> > > > > > > > > Hi,
> > > > > > > > > 
> > > > > > > > > [...]
> > > > > > > > > 
> > > > > > > > > > > Given the two totally different IPs, I don't see bugs of IP control
> > > > > > > > > > > logics should be fixed for both drivers. Naturally, the two would
> > > > > > > > > > > diverge due to different HWs. Looking at Patch 9/9, it basically
> > > > > > > > > > > squashes code to control LCDIFv3 into the mxsfb drm driver with
> > > > > > > > > > > 'if/else' checks(barely no common control code), which is hard to
> > > > > > > > > > > maintain and not able to achieve good scalability for both 'LCDIFv3'
> > > > > > > > > > > and 'LCDIF'.
> > > > > > > > > > 
> > > > > > > > > > I tend to agree with Liu here. Writing a DRM driver isn't that much
> > > > > > > > > > boilerplate anymore with all the helpers we have available in the
> > > > > > > > > > framework today.
> > > > > > > > > 
> > > > > > > > > I did write a separate driver for this IP before I spent time merging
> > > > > > > > > them into single driver, that's when I realized a single driver is much
> > > > > > > > > better and discarded the separate driver idea.
> > > > > > > > > 
> > > > > > > > > > The IP is so different from the currently supported LCDIF controllers
> > > > > > > > > > that I think trying to support this one in the existing driver actually
> > > > > > > > > > increases the chances to break something when modifying the driver in
> > > > > > > > > > the future. Not everyone is able to test all LCDIF versions. My vote is
> > > > > > > > > > on having a separate driver for the i.MX8MP LCDIF.
> > > > > > > > > 
> > > > > > > > > If you look at both controllers, it is clear it is still the LCDIF
> > > > > > > > > behind, even the CSC that is bolted on would suggest that.
> > > > > > > > 
> > > > > > > > Yes, but from a driver PoV what you care about is not really the
> > > > > > > > hardware blocks used to implement something, but the programming model,
> > > > > > > > i.e. the register interface exposed to software.
> > > > > > > > 
> > > > > > > > > I am also not happy when I look at the amount of duplication a separate
> > > > > > > > > driver would create, it will be some 50% of the code that would be just
> > > > > > > > > duplicated.
> > > > > > > > > 
> > > > > > > > Yea, the duplicated code is still significant, as the HW itself is so
> > > > > > > > simple. However, if you find yourself in the situation where basically
> > > > > > > > every actual register access in the driver ends up being in a "if (some
> > > > > > > > HW rev) ... " clause, i still think it would be better to have a
> > > > > > > > separate driver, as the programming interface is just different.
> > > > > > > 
> > > > > > > I tend to agree with Marek on this one.  We have an instance where the
> > > > > > > blk-ctrl and the GPC driver between 8m, mini, nano, plus are close,
> > > > > > > but different enough where each SoC has it's own set of tables and
> > > > > > > some checks.   Lucas created the framework, and others adapted it for
> > > > > > > various SoC's.  If there really is nearly 50% common code for the
> > > > > > > LCDIF, why not either leave the driver as one or split the common code
> > > > > > > into its own driver like lcdif-common and then have smaller drivers
> > > > > > > that handle their specific variations.
> > > > > > 
> > > > > > I don't know exactly how the standalone driver looks like, but I guess
> > > > > > the overlap is not really in any real HW specific parts, but the common
> > > > > > DRM boilerplate, so there isn't much point in creating a common lcdif
> > > > > > driver.
> > > > > 
> > > > > The mxsfb currently has 1280 LoC as of patch 8/9 of this series. Of 
> > > > > that, there is some 400 LoC which are specific to old LCDIF and this 
> > > > > patch adds 380 LoC for the new LCDIF. So that's 800 LoC or ~60% of 
> > > > > shared boilerplate that would be duplicated .
> > > > 
> > > > That is probably ignoring the fact that the 8MP LCDIF does not support
> > > > any overlays, so it could use the drm_simple_display_pipe
> > > > infrastructure to reduce the needed boilerplate.
> > > 
> > > The drm_simple_display_pipe infrastructure is probably too simple for
> > > i.MX8MP LCDIF, since it uses one only crtc for one drm device. i.MX8MP
> > > embeds *three* LCDIF instances to support MIPI DSI, LVDS and HDMI
> > > outputs respectively. To use that infrastructure means there would be
> > > three dri cards in all. However, the three LCDIF instances can be
> > > wrapped by the one drm device, which is not the boilerplate code in the
> > > current mxsfb driver may handle.
> > 
> > While that may make things a little simpler for userspace, I'm not sure
> > if this is the right thing to do. It complicates the driver a lot,
> > especially if you want to get things like independent power management,
> > etc. right. It also creates a fake view for userspace, where is looks
> > like there might be some shared resources between the different display
> > paths, while in reality they are fully independent.
> 
> Trade-off will be made between one drm device and three. My first
> impression of using the drm_simple_display_pipe infrastructure is that
> it's too simple and less flexible/scalable, because SoC designer will
> be likely to add muxes between CRTCs and encoders/bridges or overlay
> plane(s) in next generations of SoCs(SW developers don't seem have good
> reasons to suggest not to do that).  Another concern is that whether
> the userspace may use the three drm devices well or not. 
> 
> A few more points:
> 1) With one drm device, userspace may use drm lease APIs to control
> those independant pipes with drm masters(not sure about the userspace
> maturity).

I'm not sure why you are so keen on using DRM leases in your
downstream. Actually this argument is a argument in _favor_ of
independent DRM devices: you don't need to deal with leases when every
userspace component can just exclusively use a DRM device.

> 2) Code to gather all LCDIFs as one drm device has chance to be created
> as helpers once there are similar use cases in other drivers(maybe,
> there is/are already).

We already gather the GPU cores in etnaviv and as I said this decision
proves to add complications in the long run. For example prime import
with the DRM helpers is currently bound to the DRM device, so if your
actual HW devices backing the DRM device have differing DMA constraints
things get really messy.

> 3) Power management doesn't seem to be a problem, since each LCDIF has
> it's own struct device which can be used to do runtime PM at some
> drm_crtc_helper_funcs callbacks.

It's not a big problem, but it adds complexity that wouldn't be there
if you have a simple 1 IP instance <-> 1 DRM device mapping.

> 4) Regarding the fake view of shared resources, atomic check can handle
> that, so it doesn't seem to be a big problem, either.

Sure, there isn't even anything to handle, as the pipes are truly
independent.

> 
> > 
> > While we do something similar on the GPU side and collect all GPU cores
> > under a single DRM device, I'm not fully convinced that this was a good
> > decision. It now comes back to bite us when the SoC topologies get a
> > little more interesting and e.g. devices are behind different IOMMU
> > streams.
> 
> Right, SoC topologies may change, like the aforementioned muxes.
> Generally speaking, I think one drm device is more flexible and
> scalable than three.
> 
> Regards,
> Liu Ying
> 
> 


