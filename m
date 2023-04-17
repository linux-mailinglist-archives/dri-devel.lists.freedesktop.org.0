Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D0D6E46AC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 13:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B0710E453;
	Mon, 17 Apr 2023 11:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDC510E42C;
 Mon, 17 Apr 2023 11:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:Subject:Cc:To:From:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MgFPRZDdKp3+oH4fjBc8nfCYQpwYyX3bID6hvsik7sg=; b=Nvvh+ZQt3sVQCjFzhMRUXFGw9T
 5/adxO6QB/OKTAnfUnw8yRzdU8r5jN/6DYLht2i/aFp79pfiOwD8jk8M6csXUEnxA1eor/SColyxJ
 87izsp3mj9TOZv9Jdc7j9Hf7L7f1HokGsdy7QEOGpTwPsLyKvY9lXw8Lc9Jd9FSjNiqX4Q4WMTQLt
 Acf7VpHZsSc5gb7j2x7pJefIB7rBMJdkso4zEplrIOSeN2LfXCQLDeMkR64cyB4nWjgiFH1diiRsi
 og2LwEwmyxWn5Sl4sJqHrYcQj4seLkv08Ln1mOaH+Ro1jAfR9QfMChRl0032FLwVDt5MusrI0Lwt3
 hYSj44wg==;
Received: from [85.50.22.1] (helo=[192.168.1.116])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1poNET-003N8q-Gx; Mon, 17 Apr 2023 13:41:17 +0200
Message-ID: <249b7449-c47b-47e6-0582-d87bd323fbbe@igalia.com>
Date: Mon, 17 Apr 2023 13:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
From: =?UTF-8?Q?Samuel_Iglesias_Gons=c3=a1lvez?= <siglesias@igalia.com>
To: events@lists.x.org, xorg-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 libre-soc-dev@lists.libre-soc.org, members@x.org
Subject: XDC 2023: Registration & Call for Proposals now open!
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QMke06x6c5k7Wevw0x0wfOa1"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QMke06x6c5k7Wevw0x0wfOa1
Content-Type: multipart/mixed; boundary="------------K0mWwr95hZ0mMrNOAPSm9Amf";
 protected-headers="v1"
From: =?UTF-8?Q?Samuel_Iglesias_Gons=c3=a1lvez?= <siglesias@igalia.com>
To: events@lists.x.org, xorg-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 libre-soc-dev@lists.libre-soc.org, members@x.org
Cc: "board@foundation.x.org" <board@foundation.x.org>
Message-ID: <249b7449-c47b-47e6-0582-d87bd323fbbe@igalia.com>
Subject: XDC 2023: Registration & Call for Proposals now open!

--------------K0mWwr95hZ0mMrNOAPSm9Amf
Content-Type: multipart/mixed; boundary="------------U0djho2cVREaiyfLP6ijUovS"

--------------U0djho2cVREaiyfLP6ijUovS
Content-Type: multipart/alternative;
 boundary="------------YrMf1Wu3jWIZGsIOrICwSKrG"

--------------YrMf1Wu3jWIZGsIOrICwSKrG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8hDQoNClJlZ2lzdHJhdGlvbiAmIENhbGwgZm9yIFByb3Bvc2FscyBhcmUgbm93IG9w
ZW4gZm9yIFhEQyAyMDIzLCB3aGljaCB3aWxsDQp0YWtlIHBsYWNlIG9uIE9jdG9iZXIgMTct
MTksIDIwMjMuDQoNCmh0dHBzOi8veGRjMjAyMy54Lm9yZw0KDQpBcyB1c3VhbCwgdGhlIGNv
bmZlcmVuY2UgaXMgZnJlZSBvZiBjaGFyZ2UgYW5kIG9wZW4gdG8gdGhlIGdlbmVyYWwNCnB1
YmxpYy4gSWYgeW91IHBsYW4gb24gYXR0ZW5kaW5nLCBwbGVhc2UgbWFrZSBzdXJlIHRvIHJl
Z2lzdGVyIGFzIGVhcmx5DQphcyBwb3NzaWJsZSENCg0KSW4gb3JkZXIgdG8gcmVnaXN0ZXIg
YXMgYXR0ZW5kZWUsIHlvdSB3aWxsIHRoZXJlZm9yZSBuZWVkIHRvIHJlZ2lzdGVyDQp2aWEg
dGhlIFhEQyB3ZWJzaXRlLg0KDQpodHRwczovL2luZGljby5mcmVlZGVza3RvcC5vcmcvZXZl
bnQvNC9yZWdpc3RyYXRpb25zLw0KDQpJbiBhZGRpdGlvbiB0byByZWdpc3RyYXRpb24sIHRo
ZSBDZlAgaXMgbm93IG9wZW4gZm9yIHRhbGtzLCB3b3Jrc2hvcHMNCmFuZCBkZW1vcyBhdCBY
REMgMjAyMy4gV2hpbGUgYW55IHNlcmlvdXMgcHJvcG9zYWwgd2lsbCBiZSBncmF0ZWZ1bGx5
DQpjb25zaWRlcmVkLCB0b3BpY3Mgb2YgaW50ZXJlc3QgdG8gWC5PcmcgYW5kIGZyZWVkZXNr
dG9wLm9yZyBkZXZlbG9wZXJzDQphcmUgZW5jb3VyYWdlZC4gVGhlIHByb2dyYW0gZm9jdXMg
aXMgb24gbmV3IGRldmVsb3BtZW50LCBvbmdvaW5nDQpjaGFsbGVuZ2VzIGFuZCBhbnl0aGlu
ZyBlbHNlIHRoYXQgd2lsbCBzcGFyayBkaXNjdXNzaW9ucyBhbW9uZw0KYXR0ZW5kZWVzIGlu
IHRoZSBoYWxsd2F5IHRyYWNrLg0KDQpXZSBhcmUgb3BlbiB0byB0YWxrcyBhY3Jvc3MgYWxs
IGxheWVycyBvZiB0aGUgZ3JhcGhpY3Mgc3RhY2ssIGZyb20gdGhlDQprZXJuZWwgdG8gZGVz
a3RvcCBlbnZpcm9ubWVudHMgLyBncmFwaGljYWwgYXBwbGljYXRpb25zIGFuZCBhYm91dCBo
b3cNCnRvIG1ha2UgdGhpbmdzIGJldHRlciBmb3IgdGhlIGRldmVsb3BlcnMgd2hvIGJ1aWxk
IHRoZW0uIEhlYWQgdG8gdGhlDQpDZlAgcGFnZSB0byBsZWFybiBtb3JlOg0KDQpodHRwczov
L2luZGljby5mcmVlZGVza3RvcC5vcmcvZXZlbnQvNC9hYnN0cmFjdHMvDQoNClRoZSBkZWFk
bGluZSBmb3Igc3VibWlzc2lvbnMgaXMgTW9uZGF5LCAxNyBKdWx5IDIwMjMgKDIzOjU5IENF
U1QpDQoNCkNoZWNrIG91dCBvdXIgUmVpbWJ1cnNlbWVudCBQb2xpY3kgdG8gYWNjZXB0IHNw
ZWFrZXIgZXhwZW5zZXM6DQoNCmh0dHBzOi8vd3d3Lngub3JnL3dpa2kvWG9yZ0ZvdW5kYXRp
b24vUG9saWNpZXMvUmVpbWJ1cnNlbWVudC8NCg0KSWYgeW91IGhhdmUgYW55IHF1ZXN0aW9u
cywgcGxlYXNlIHNlbmQgbWUgYW4gZW1haWwgdG8NCnNpZ2xlc2lhcyBBVCBpZ2FsaWEuY29t
LCBhZGRpbmcgb24gQ2MgdGhlIFgub3JnIGJvYXJkIChib2FyZA0KYXQgZm91bmRhdGlvbi54
Lm9yZykuDQoNCkFuZCBwbGVhc2Uga2VlcCBpbiBtaW5kLCB5b3UgY2FuIGZvbGxvdyB1cyBv
biBUd2l0dGVyIGZvciBhbGwgdGhlIGxhdGVzdA0KdXBkYXRlcyBhbmQgdG8gc3RheSBjb25u
ZWN0ZWQ6DQoNCmh0dHBzOi8vdHdpdHRlci5jb20vWE9yZ0RldkNvbmYNCg0KQmVzdCwNCg0K
U2FtDQoNCg==
--------------YrMf1Wu3jWIZGsIOrICwSKrG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html data-lt-installed=3D"true">
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
    <script data-cookieconsent=3D"ignore" src=3D"moz-extension://eea31378=
-988a-46ea-af0f-ff8605fa6a0d/content/executor.js"></script>
  </head>
  <body style=3D"padding-bottom: 1px;">
    <p>Hello!<br>
      =C2=A0<br>
      Registration &amp; Call for Proposals are now open for XDC 2023,
      which will<br>
      take place on October 17-19, 2023. <br>
      <br>
      <a class=3D"moz-txt-link-freetext" href=3D"https://xdc2023.x.org">h=
ttps://xdc2023.x.org</a><br>
      =C2=A0<br>
      As usual, the conference is free of charge and open to the general<=
br>
      public. If you plan on attending, please make sure to register as
      early<br>
      as possible!<br>
      =C2=A0<br>
      In order to register as attendee, you will therefore need to
      register<br>
      via the XDC website.<br>
      =C2=A0<br>
      <a class=3D"moz-txt-link-freetext" href=3D"https://indico.freedeskt=
op.org/event/4/registrations/">https://indico.freedesktop.org/event/4/reg=
istrations/</a><br>
      =C2=A0<br>
      In addition to registration, the CfP is now open for talks,
      workshops<br>
      and demos at XDC 2023. While any serious proposal will be
      gratefully<br>
      considered, topics of interest to X.Org and freedesktop.org
      developers<br>
      are encouraged. The program focus is on new development, ongoing<br=
>
      challenges and anything else that will spark discussions among<br>
      attendees in the hallway track.<br>
      =C2=A0<br>
      We are open to talks across all layers of the graphics stack, from
      the<br>
      kernel to desktop environments / graphical applications and about
      how<br>
      to make things better for the developers who build them. Head to
      the<br>
      CfP page to learn more: <br>
      =C2=A0<br>
      <a class=3D"moz-txt-link-freetext" href=3D"https://indico.freedeskt=
op.org/event/4/abstracts/">https://indico.freedesktop.org/event/4/abstrac=
ts/</a><br>
      =C2=A0<br>
      The deadline for submissions is Monday, 17 July 2023 (23:59 CEST)<b=
r>
      =C2=A0<br>
      Check out our Reimbursement Policy to accept speaker expenses:<br>
      =C2=A0<br>
      <a class=3D"moz-txt-link-freetext" href=3D"https://www.x.org/wiki/X=
orgFoundation/Policies/Reimbursement/">https://www.x.org/wiki/XorgFoundat=
ion/Policies/Reimbursement/</a><br>
      =C2=A0<br>
      If you have any questions, please send me an email to<br>
      siglesias AT igalia.com, adding on Cc the X.org board (board<br>
      at foundation.x.org).<br>
      =C2=A0<br>
      And please keep in mind, you can follow us on Twitter for all the
      latest<br>
      updates and to stay connected:<br>
      =C2=A0<br>
      <a class=3D"moz-txt-link-freetext" href=3D"https://twitter.com/XOrg=
DevConf">https://twitter.com/XOrgDevConf</a><br>
      =C2=A0<br>
      Best,<br>
      =C2=A0<br>
      Sam<br>
    </p>
  </body>
  <lt-container></lt-container>
</html>

--------------YrMf1Wu3jWIZGsIOrICwSKrG--

--------------U0djho2cVREaiyfLP6ijUovS
Content-Type: application/pgp-keys; name="OpenPGP_0x7FF4BA32F17DC343.asc"
Content-Disposition: attachment; filename="OpenPGP_0x7FF4BA32F17DC343.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D=3D
=3DzaNC
-----END PGP PUBLIC KEY BLOCK-----

--------------U0djho2cVREaiyfLP6ijUovS--

--------------K0mWwr95hZ0mMrNOAPSm9Amf--

--------------QMke06x6c5k7Wevw0x0wfOa1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEQP+ZAvaXWkfuKXiEf/S6MvF9w0MFAmQ9MFsFAwAAAAAACgkQf/S6MvF9w0Mq
GBAAlC1GNfSJuduJecn6QnOr/SJk+avS6IqrYQqlTYV8vtZUA52kMm7iTV8J5YMBji7VHWBiKR61
XqXq7DNMGABeVUCnf45TyYX61bqVV9ipOeQYN07KQdlAWbYAc1A26Z+SrcJzJXxssByDmVAm4iir
5oTLKdVed0Cw3ZBTtVPy5FJyQ8Nc47YJZbDUE059mJdNq0Y5byolN9HfLzvFcAs65U0DIL4o1VwG
ilFGtibu1WzaXGI9/tGHlRCwHzi586zIdGSSeoMV0G5CqfkhW2cgDg9VvBP83D4jVXe9LU3aiwIz
OVT1U/xwwPBkPjQVNQDp6cSJ9uU4aqhjskxB2awSIoifI7/Upd4muiUlhWDV/0sQT6UtvHNhN/sQ
FVzRJL8GZRMqfjlJPlX6ybQA9wxGyctIxOCWrRKL+v/2gS9I/MM3pzH00fGbh+kbqnU+or4DyInW
KcdvC5ukcp8rbkhncV1WE1X9kUld/uYiMXJylaLsmKs4qZh4iPIaAAZeLE6Sf8PFbPg/l6ywC3sF
dHuCGaks9wRI0oHlQSVQuP1iITeD5qEHlbJMqQc9+ce5nQQvTkXUM4r3uD/kk+oSyWabJ7vm82Qq
9CRXHJNDhoJcIHJr3F5zWn5w6EFmoM1GMUnufIPixqzoZywzXqt+oCsL+4GiCjRfSGDj1uD2OaET
CaU=
=U3YP
-----END PGP SIGNATURE-----

--------------QMke06x6c5k7Wevw0x0wfOa1--
