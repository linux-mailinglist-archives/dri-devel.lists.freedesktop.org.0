Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5B46FC4EC
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 13:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C58E10E38B;
	Tue,  9 May 2023 11:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6010310E38B;
 Tue,  9 May 2023 11:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0MQkFeIGzWIBluagXjVI3JmBz4AEW9EmKlzeVHozuJg=; b=UTAGwpOYIWZPlGb8ftK7Yoj0a4
 i76qpr6tiHH0KAnj5LU9k6b53cN/1lbtaG/FdEk22k2IT00+/KkSx7JL7vqTKta8zaCLRfwvRLEdd
 5MVcBNikKWYLffxndbLPyGJ2ShrMi+4P/yc+zEI0ios8hKyKjgglUasvN8kr0reXwvWL26HEEe3IJ
 LHQV4RyaGZ4HwWXP4xM9mqqopHbEaPPyzc89tgylqdWkygFXfG/XkCa9j+BxJJhQ+ylfKjB9xvw+0
 5iKgJ63DN5nf6H5kVyTLo+tXOva0qphqWlZqZd6XneNFzNYWleZJ9roXMPFN6o/ytJIeCEY+kakcL
 AfzOuFXQ==;
Received: from [38.44.72.37] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pwLS2-004l3F-6i; Tue, 09 May 2023 13:24:14 +0200
Date: Tue, 9 May 2023 10:23:49 -0100
From: Melissa Wen <mwen@igalia.com>
To: Joshua Ashton <joshua@froggi.es>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <20230509112349.ognmkrjkjuorl25x@mail.igalia.com>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <20230505144150.741a90e1@eldfell>
 <CAEZNXZDnCeZKTJvTwFYnrECzjLc+WEhUG5y-GBDmOeoMBCdJ+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ukartrmhqjdqa3th"
Content-Disposition: inline
In-Reply-To: <CAEZNXZDnCeZKTJvTwFYnrECzjLc+WEhUG5y-GBDmOeoMBCdJ+A@mail.gmail.com>
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
Cc: Jonas =?utf-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>, Sebastian Wick <sebastian.wick@redhat.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ukartrmhqjdqa3th
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/05, Joshua Ashton wrote:
> Some corrections and replies inline.
>=20
> On Fri, 5 May 2023 at 12:42, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > On Thu, 04 May 2023 15:22:59 +0000
> > Simon Ser <contact@emersion.fr> wrote:
> >
> > > Hi all,
> > >
> > > The goal of this RFC is to expose a generic KMS uAPI to configure the=
 color
> > > pipeline before blending, ie. after a pixel is tapped from a plane's
> > > framebuffer and before it's blended with other planes. With this new =
uAPI we
> > > aim to reduce the battery life impact of color management and HDR on =
mobile
> > > devices, to improve performance and to decrease latency by skipping
> > > composition on the 3D engine. This proposal is the result of discussi=
ons at
> > > the Red Hat HDR hackfest [1] which took place a few days ago. Enginee=
rs
> > > familiar with the AMD, Intel and NVIDIA hardware have participated in=
 the
> > > discussion.
> >
> > Hi Simon,
> >
> > this is an excellent write-up, thank you!
> >
> > Harry's question about what constitutes UAPI is a good one for danvet.
> >
> > I don't really have much to add here, a couple inline comments. I think
> > this could work.
> >
> > >
> > > This proposal takes a prescriptive approach instead of a descriptive =
approach.
> > > Drivers describe the available hardware blocks in terms of low-level
> > > mathematical operations, then user-space configures each block. We de=
cided
> > > against a descriptive approach where user-space would provide a high-=
level
> > > description of the colorspace and other parameters: we want to give m=
ore
> > > control and flexibility to user-space, e.g. to be able to replicate e=
xactly the
> > > color pipeline with shaders and switch between shaders and KMS pipeli=
nes
> > > seamlessly, and to avoid forcing user-space into a particular color m=
anagement
> > > policy.
> > >
> > > We've decided against mirroring the existing CRTC properties
> > > DEGAMMA_LUT/CTM/GAMMA_LUT onto KMS planes. Indeed, the color manageme=
nt
> > > pipeline can significantly differ between vendors and this approach c=
annot
> > > accurately abstract all hardware. In particular, the availability, or=
dering and
> > > capabilities of hardware blocks is different on each display engine. =
So, we've
> > > decided to go for a highly detailed hardware capability discovery.
> > >
> > > This new uAPI should not be in conflict with existing standard KMS pr=
operties,
> > > since there are none which control the pre-blending color pipeline at=
 the
> > > moment. It does conflict with any vendor-specific properties like
> > > NV_INPUT_COLORSPACE or the patches on the mailing list adding AMD-spe=
cific
> > > properties. Drivers will need to either reject atomic commits configu=
ring both
> > > uAPIs, or alternatively we could add a DRM client cap which hides the=
 vendor
> > > properties and shows the new generic properties when enabled.
> > >
> > > To use this uAPI, first user-space needs to discover hardware capabil=
ities via
> > > KMS objects and properties, then user-space can configure the hardwar=
e via an
> > > atomic commit. This works similarly to the existing KMS uAPI, e.g. pl=
anes.
> > >
> > > Our proposal introduces a new "color_pipeline" plane property, and a =
new KMS
> > > object type, "COLOROP" (short for color operation). The "color_pipeli=
ne" plane
> > > property is an enum, each enum entry represents a color pipeline supp=
orted by
> > > the hardware. The special zero entry indicates that the pipeline is in
> > > "bypass"/"no-op" mode. For instance, the following plane properties d=
escribe a
> > > primary plane with 2 supported pipelines but currently configured in =
bypass
> > > mode:
> > >
> > >     Plane 10
> > >     =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Curs=
or} =3D Primary
> > >     =E2=94=9C=E2=94=80 =E2=80=A6
> > >     =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42, 52} =3D 0
> > >
> > > The non-zero entries describe color pipelines as a linked list of COL=
OROP KMS
> > > objects. The entry value is an object ID pointing to the head of the =
linked
> > > list (the first operation in the color pipeline).
> > >
> > > The new COLOROP objects also expose a number of KMS properties. Each =
has a
> > > type, a reference to the next COLOROP object in the linked list, and =
other
> > > type-specific properties. Here is an example for a 1D LUT operation:
> > >
> > >     Color operation 42
> > >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> > >     =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, PQ, BT.709, =
HLG, =E2=80=A6} =3D LUT
> > >     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> > >     =E2=94=9C=E2=94=80 "lut_data": blob
> > >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> > >
> > > To configure this hardware block, user-space can fill a KMS blob with=
 4096 u32
> > > entries, then set "lut_data" to the blob ID. Other color operation ty=
pes might
> > > have different properties.
> > >
> > > Here is another example with a 3D LUT:
> > >
> > >     Color operation 42
> > >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 3D LUT} =3D 3D LUT
> > >     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 33
> > >     =E2=94=9C=E2=94=80 "lut_data": blob
> > >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> > >
> > > And one last example with a matrix:
> > >
> > >     Color operation 42
> > >     =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> > >     =E2=94=9C=E2=94=80 "matrix_data": blob
> > >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> > >
> > > [Simon note: having "Bypass" in the "type" enum, and making "type" mu=
table is
> > > a bit weird. Maybe we can just add an "active"/"bypass" boolean prope=
rty on
> > > blocks which can be bypassed instead.]
> > >
> > > [Jonas note: perhaps a single "data" property for both LUTs and matri=
ces
> > > would make more sense. And a "size" prop for both 1D and 3D LUTs.]
> > >
> > > If some hardware supports re-ordering operations in the color pipelin=
e, the
> > > driver can expose multiple pipelines with different operation orderin=
g, and
> > > user-space can pick the ordering it prefers by selecting the right pi=
peline.
> > > The same scheme can be used to expose hardware blocks supporting mult=
iple
> > > precision levels.
> > >
> > > That's pretty much all there is to it, but as always the devil is in =
the
> > > details.
> > >
> > > First, we realized that we need a way to indicate where the scaling o=
peration
> > > is happening. The contents of the framebuffer attached to the plane m=
ight be
> > > scaled up or down depending on the CRTC_W and CRTC_H properties. Depe=
nding on
> > > the colorspace scaling is applied in, the result will be different, s=
o we need
> > > a way for the kernel to indicate which hardware blocks are pre-scalin=
g, and
> > > which ones are post-scaling. We introduce a special "scaling" operati=
on type,
> > > which is part of the pipeline like other operations but serves an inf=
ormational
> > > role only (effectively, the operation cannot be configured by user-sp=
ace, all
> > > of its properties are immutable). For example:
> > >
> > >     Color operation 43
> > >     =E2=94=9C=E2=94=80 "type": immutable enum {Scaling} =3D Scaling
> > >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 44
> >
> > I like this.
> >
> > >
> > > [Simon note: an alternative would be to split the color pipeline into=
 two, by
> > > having two plane properties ("color_pipeline_pre_scale" and
> > > "color_pipeline_post_scale") instead of a single one. This would be s=
imilar to
> > > the way we want to split pre-blending and post-blending. This could b=
e less
> > > expressive for drivers, there may be hardware where there are depende=
ncies
> > > between the pre- and post-scaling pipeline?]
> > >
> > > Then, Alex from NVIDIA described how their hardware works. NVIDIA har=
dware
> > > contains some fixed-function blocks which convert from LMS to ICtCp a=
nd cannot
> > > be disabled/bypassed. NVIDIA hardware has been designed for descripti=
ve APIs
> > > where user-space provides a high-level description of the colorspace
> > > conversions it needs to perform, and this is at odds with our KMS uAPI
> > > proposal. To address this issue, we suggest adding a special block ty=
pe which
> > > describes a fixed conversion from one colorspace to another and canno=
t be
> > > configured by user-space. Then user-space will need to accomodate its=
 pipeline
> > > for these special blocks. Such fixed hardware blocks need to be well =
enough
> > > documented so that they can be implemented via shaders.
> > >
> > > We also noted that it should always be possible for user-space to com=
pletely
> > > disable the color pipeline and switch back to bypass/identity without=
 a
> > > modeset. Some drivers will need to fail atomic commits for some color
> > > pipelines, in particular for some specific LUT payloads. For instance=
, AMD
> > > doesn't support curves which are too steep, and Intel doesn't support=
 curves
> > > which decrease. This isn't something which routinely happens, but the=
re might
> > > be more cases where the hardware needs to reject the pipeline. Thus, =
when
> > > user-space has a running KMS color pipeline, then hits a case where t=
he
> > > pipeline cannot keep running (gets rejected by the driver), user-spac=
e needs to
> > > be able to immediately fall back to shaders without any glitch. This =
doesn't
> > > seem to be an issue for AMD, Intel and NVIDIA.
> > >
> > > This uAPI is extensible: we can add more color operations, and we can=
 add more
> > > properties for each color operation type. For instance, we might want=
 to add
> > > support for Intel piece-wise linear (PWL) 1D curves, or might want to=
 advertise
> > > the effective precision of the LUTs. The uAPI is deliberately somewha=
t minimal
> > > to keep the scope of the proposal manageable.
> > >
> > > Later on, we plan to re-use the same machinery for post-blending color
> > > pipelines. There are some more details about post-blending which have=
 been
> > > separately debated at the hackfest, but we believe it's a viable plan=
=2E This
> > > solution would supersede the existing DEGAMMA_LUT/CTM/GAMMA_LUT prope=
rties, so
> > > we'd like to introduce a client cap to hide the old properties and sh=
ow the new
> > > post-blending color pipeline properties.
> > >
> > > We envision a future user-space library to translate a high-level des=
criptive
> > > color pipeline into low-level prescriptive KMS color pipeline ("libli=
ftoff but
> > > for color pipelines"). The library could also offer a translation int=
o shaders.
> > > This should help share more infrastructure between compositors and ea=
se KMS
> > > offloading. This should also help dealing with the NVIDIA case.
> > >
> > > To wrap things up, let's take a real-world example: how would gamesco=
pe [2]
> > > configure the AMD DCN 3.0 hardware for its color pipeline? The gamesc=
ope color
> > > pipeline is described in [3]. The AMD DCN 3.0 hardware is described i=
n [4].
> > >
> > > AMD would expose the following objects and properties:
> > >
> > >     Plane 10
> > >     =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Curs=
or} =3D Primary
> > >     =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42} =3D 0
> > >     Color operation 42 (input CSC)
> > >     =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> > >     =E2=94=9C=E2=94=80 "matrix_data": blob
> > >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> > >     Color operation 43
> > >     =E2=94=9C=E2=94=80 "type": enum {Scaling} =3D Scaling
> > >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 44
> > >     Color operation 44 (DeGamma)
> > >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> > >     =E2=94=9C=E2=94=80 "1d_curve_type": enum {sRGB, PQ, =E2=80=A6} =
=3D sRGB
> > >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 45
>=20
> Some vendors have per-tap degamma and some have a degamma after the sampl=
e.
> How do we distinguish that behaviour?
> It is important to know.
>=20
> > >     Color operation 45 (gamut remap)
> > >     =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> > >     =E2=94=9C=E2=94=80 "matrix_data": blob
> > >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 46
> > >     Color operation 46 (shaper LUT RAM)
> > >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> > >     =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT} =3D LUT
> > >     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> > >     =E2=94=9C=E2=94=80 "lut_data": blob
> > >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 47
> > >     Color operation 47 (3D LUT RAM)
> > >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 3D LUT} =3D 3D LUT
> > >     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 17
> > >     =E2=94=9C=E2=94=80 "lut_data": blob
> > >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 48
> > >     Color operation 48 (blend gamma)
> > >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> > >     =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, PQ, =E2=80=
=A6} =3D LUT
> > >     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> > >     =E2=94=9C=E2=94=80 "lut_data": blob
> > >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 0
> > >
> > > To configure the pipeline for an HDR10 PQ plane (path at the top) and=
 a HDR
> > > display, gamescope would perform an atomic commit with the following =
property
> > > values:
> > >
> > >     Plane 10
> > >     =E2=94=94=E2=94=80 "color_pipeline" =3D 42
> > >     Color operation 42 (input CSC)
> > >     =E2=94=94=E2=94=80 "matrix_data" =3D PQ =E2=86=92 scRGB (TF)
>=20
> ^
> Not sure what this is.
> We don't use an input CSC before degamma.
>=20
> > >     Color operation 44 (DeGamma)
> > >     =E2=94=94=E2=94=80 "type" =3D Bypass
>=20
> ^
> If we did PQ, this would be PQ -> Linear / 80
> If this was sRGB, it'd be sRGB -> Linear
> If this was scRGB this would be just treating it as it is. So... Linear /=
 80.
>=20
> > >     Color operation 45 (gamut remap)
> > >     =E2=94=94=E2=94=80 "matrix_data" =3D scRGB (TF) =E2=86=92 PQ
>=20
> ^
> This is wrong, we just use this to do scRGB primaries (709) to 2020.
>=20
> We then go from scRGB -> PQ to go into our shaper + 3D LUT.
>=20
> > >     Color operation 46 (shaper LUT RAM)
> > >     =E2=94=94=E2=94=80 "lut_data" =3D PQ =E2=86=92 Display native
>=20
> ^
> "Display native" is just the response curve of the display.
> In HDR10, this would just be PQ -> PQ
> If we were doing HDR10 on SDR, this would be PQ -> Gamma 2.2 (mapped
> from 0 to display native luminance) [with a potential bit of headroom
> for tonemapping in the 3D LUT]
> For SDR on HDR10 this would be Gamma 2.2 -> PQ (Not intending to start
> an sRGB vs G2.2 argument here! :P)
>=20
> > >     Color operation 47 (3D LUT RAM)
> > >     =E2=94=94=E2=94=80 "lut_data" =3D Gamut mapping + tone mapping + =
night mode
> > >     Color operation 48 (blend gamma)
> > >     =E2=94=94=E2=94=80 "1d_curve_type" =3D PQ
>=20
> ^
> This is wrong, this should be Display Native -> Linearized Display Referr=
ed

This is a good point to discuss. I understand for the HDR10 case that we
are just setting an enumerated TF (that is PQ for this case - correct me
if I got it wrong) but, unlike when we use a user-LUT, we don't know
=66rom the API that this enumerated TF value with an empty LUT is used for
linearizing/degamma. Perhaps this could come as a pair? Any idea?

>=20
> >
> > You cannot do a TF with a matrix, and a gamut remap with a matrix on
> > electrical values is certainly surprising, so the example here is a
> > bit odd, but I don't think that hurts the intention of demonstration.
>=20
> I have done some corrections inline.
>=20
> You can see our fully correct color pipeline here:
> https://raw.githubusercontent.com/ValveSoftware/gamescope/master/src/docs=
/Steam%20Deck%20Display%20Pipeline.png
>=20
> Please let me know if you have any more questions about our color pipelin=
e.
>=20
> >
> > Btw. ISTR that if you want to do scaling properly with alpha channel,
> > you need optical values multiplied by alpha. Alpha vs. scaling is just
> > yet another thing to look into, and TF operations do not work with
> > pre-mult.
>=20
> What are your concerns here?
>=20
> Having pre-multiplied alpha is fine with a TF: the alpha was
> premultiplied in linear, then encoded with the TF by the client.
> If you think of a TF as something something relative to a bunch of
> reference state or whatever then you might think "oh you can't do
> that!", but you really can.
> It's really best to just think of it as a mathematical encoding of a
> value in all instances that we touch.
>=20
> The only issue is that you lose precision from having pre-multiplied
> alpha as it's quantized to fit into the DRM format rather than using
> the full range then getting divided by the alpha at blend time.
> It doesn't end up being a visible issue ever however in my experience, at=
 8bpc.
>=20
> Thanks
>  - Joshie =F0=9F=90=B8=E2=9C=A8
>=20
> >
> >
> > Thanks,
> > pq
> >
> > >
> > > I hope comparing these properties to the diagrams linked above can he=
lp
> > > understand how the uAPI would be used and give an idea of its viabili=
ty.
> > >
> > > Please feel free to provide feedback! It would be especially useful t=
o have
> > > someone familiar with Arm SoCs look at this, to confirm that this pro=
posal
> > > would work there.
> > >
> > > Unless there is a show-stopper, we plan to follow up this RFC with
> > > implementations for AMD, Intel, NVIDIA, gamescope, and IGT.
> > >
> > > Many thanks to everybody who contributed to the hackfest, on-site or =
remotely!
> > > Let's work together to make this happen!
> > >
> > > Simon, on behalf of the hackfest participants
> > >
> > > [1]: https://wiki.gnome.org/Hackfests/ShellDisplayNext2023
> > > [2]: https://github.com/ValveSoftware/gamescope
> > > [3]: https://github.com/ValveSoftware/gamescope/blob/5af321724c8b8a29=
cef5ae9e31293fd5d560c4ec/src/docs/Steam%20Deck%20Display%20Pipeline.png
> > > [4]: https://kernel.org/doc/html/latest/_images/dcn3_cm_drm_current.s=
vg
> >

--ukartrmhqjdqa3th
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmRaLT8ACgkQwqF3j0dL
ehywxhAAjjRlf9PRgQFmjyf8qXYUUCH3BVtblgNvnuEUCnv45QH9/JkJuow+qbY5
t91OB2PiKMww1VLq/nVIIkdcG028ZHqL/kLUitfIYzQsqOZvNG2B+uL5CATx9kZu
uAwZrFl7aCgbCRdhCd0mo9ddyHBxK8VeNhAgD6Zlfz+sArE9XC/zf3VbVkc6eVIN
wMCTy6CdC9s2yeZhXivo70T5hFbfLJutgOvzUDe500czBiGMiFczryMJkkfXWZEo
GDVDY7MAOAv8nqEdhEliDEB2htdZU73onnNcws0Kc2PFezvmEhEFMe2fIBvCmUbF
nZQkMgX64IqCiZnnDI+z/42g48FId+TVHmkRisUU468mi+uteu0lMhsqAt0dX4qx
M/icMy1lqwo36gqEmYnx8LJ1u/BjmZOkEZUOR8eItQBn+UBFhPKnbg+R0b+kSx+/
gGzFYt9jNL7ggAXboYvDBWHp1e3XJgI9NoTYF5URaN5p6DYYg2ttL0D+lmiUwt2o
YuQS8aaC3SQTEI51sPoCkmtM1NqDxuBZyP8ddNpuWzSPptotRvKu6H222xRrJTWP
E9/WfGFJcgBdAAQYWWPITJxEj92a5xTfAbYucXgLYpyfPNPIga04i/LWhihY7LEq
Eb4RRI6H66Uw+rzrMIvBWA/d3Fctxaj0YJGpSQtmTEjjoogNV4I=
=st2I
-----END PGP SIGNATURE-----

--ukartrmhqjdqa3th--
