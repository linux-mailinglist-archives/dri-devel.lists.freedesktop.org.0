Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F2074EB61
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 12:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBA210E359;
	Tue, 11 Jul 2023 10:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC1110E358;
 Tue, 11 Jul 2023 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qy38nSyAkc0qhzNnog8BBlXyEItM31ZP1dtbuk4NSas=; b=YzhsIwXDM/xfGCzRI0DCeI11qh
 CQIXsKrBKQsDwj1LStUbfcE25/lr4Y0GGCNp1ob90ewpSdjOOnK/6V0Y7Joh2pLt8alHCqv6Bhss7
 tRqQDEqCAu0zfnBRwUVuK1ERbrt/uCPTluyyZEY80K3/3D6az+oe9JZ1nPAOrwvqG9V5U3F30MIx1
 4hjrpOvdIjXc2UrNUN0FPuVFHQ0ENxtp/V7lWWxXYINvcOAytQVoO47O9OMrMgWOIiMC09vjyGvrS
 n/iHpLS2tMBRMDrNQrIxXZUcNwLt9y/xxBHRlWhzfSPAp+azAJZ+AStXtMo+ExeWOhxH89/j6g3Bo
 K0mMqhlQ==;
Received: from 55.red-83-52-4.dynamicip.rima-tde.net ([83.52.4.55]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qJADd-00CLEz-HK; Tue, 11 Jul 2023 12:03:41 +0200
Message-ID: <2c97b770da11457583c48b200e4f989c05ecc023.camel@igalia.com>
Subject: Re: XDC 2023: Registration & Call for Proposals now open!
From: Ricardo Garcia <rgarcia@igalia.com>
To: Samuel Iglesias =?ISO-8859-1?Q?Gons=E1lvez?= <siglesias@igalia.com>, 
 events@lists.x.org, xorg-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 libre-soc-dev@lists.libre-soc.org, members@x.org
Date: Tue, 11 Jul 2023 12:03:40 +0200
In-Reply-To: <43ee9173619f841ab7aab965441114cf9a6263b5.camel@igalia.com>
References: <249b7449-c47b-47e6-0582-d87bd323fbbe@igalia.com>
 <43ee9173619f841ab7aab965441114cf9a6263b5.camel@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
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
Cc: "board@foundation.x.org" <board@foundation.x.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

New reminder that the XDC 2023 Registration and Call for Proposals are
open till the end of this week. The deadline is July 17. Please submit
your proposals ASAP! You can find more information about XDC 2023 in
previous emails below.

Thanks again for your attention,
-Ricardo

On Tue, 2023-06-27 at 16:24 +0200, Ricardo Garcia wrote:
> This is a reminder that the XDC 2023 Registration and the Call for
> Proposals are still open and will be open for about 2 more weeks. Do not
> forget to submit your proposals before the deadline (July 17)!
>=20
> The conference will take place in A Coru=C3=B1a this year, from October 1=
7 to
> 19. You can find more information about the conference in the links
> below and you can also follow us on Mastodon for the latest updates.
>=20
> https://floss.social/@XOrgDevConf
>=20
> Thanks for your attention,
> -Ricardo
>=20
> On Mon, 2023-04-17 at 13:41 +0200, Samuel Iglesias Gons=C3=A1lvez wrote:
> > =C2=A0
> > Hello!
> > =C2=A0=C2=A0
> > =C2=A0Registration & Call for Proposals are now open for XDC 2023, whic=
h will
> > =C2=A0take place on October 17-19, 2023.=20
> > =C2=A0
> > =C2=A0https://xdc2023.x.org
> > =C2=A0=C2=A0
> > =C2=A0As usual, the conference is free of charge and open to the genera=
l
> > =C2=A0public. If you plan on attending, please make sure to register as=
 early
> > =C2=A0as possible!
> > =C2=A0=C2=A0
> > =C2=A0In order to register as attendee, you will therefore need to regi=
ster
> > =C2=A0via the XDC website.
> > =C2=A0=C2=A0
> > =C2=A0https://indico.freedesktop.org/event/4/registrations/
> > =C2=A0=C2=A0
> > =C2=A0In addition to registration, the CfP is now open for talks, works=
hops
> > =C2=A0and demos at XDC 2023. While any serious proposal will be gratefu=
lly
> > =C2=A0considered, topics of interest to X.Org and freedesktop.org devel=
opers
> > =C2=A0are encouraged. The program focus is on new development, ongoing
> > =C2=A0challenges and anything else that will spark discussions among
> > =C2=A0attendees in the hallway track.
> > =C2=A0=C2=A0
> > =C2=A0We are open to talks across all layers of the graphics stack, fro=
m the
> > =C2=A0kernel to desktop environments / graphical applications and about=
 how
> > =C2=A0to make things better for the developers who build them. Head to =
the
> > =C2=A0CfP page to learn more:=20
> > =C2=A0=C2=A0
> > =C2=A0https://indico.freedesktop.org/event/4/abstracts/
> > =C2=A0=C2=A0
> > =C2=A0The deadline for submissions is Monday, 17 July 2023 (23:59 CEST)
> > =C2=A0=C2=A0
> > =C2=A0Check out our Reimbursement Policy to accept speaker expenses:
> > =C2=A0=C2=A0
> > =C2=A0https://www.x.org/wiki/XorgFoundation/Policies/Reimbursement/
> > =C2=A0=C2=A0
> > =C2=A0If you have any questions, please send me an email to
> > =C2=A0siglesias AT igalia.com, adding on Cc the X.org board (board
> > =C2=A0at foundation.x.org).
> > =C2=A0=C2=A0
> > =C2=A0And please keep in mind, you can follow us on Twitter for all the=
 latest
> > =C2=A0updates and to stay connected:
> > =C2=A0=C2=A0
> > =C2=A0https://twitter.com/XOrgDevConf
> > =C2=A0=C2=A0
> > =C2=A0Best,
> > =C2=A0=C2=A0
> > =C2=A0Sam
> > =C2=A0
> > =C2=A0
>=20

