Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCDE8CA3CD
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 23:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FC710E99C;
	Mon, 20 May 2024 21:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=craftyguy.net header.i=@craftyguy.net header.b="Fka88Yrv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 375 seconds by postgrey-1.36 at gabe;
 Mon, 20 May 2024 21:31:32 UTC
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com
 [91.218.175.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE4910E7C5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 21:31:32 +0000 (UTC)
X-Envelope-To: dmitry.baryshkov@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=craftyguy.net;
 s=key1; t=1716240313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vUvH5jLFKS8ZJjY4j9RQcwZcSEH5BkTc187jlkX2lK4=;
 b=Fka88YrvL+hnRHBW4Tsnsrm/FcUvgRiBwCJ2rZBRf9vYlcjjR4s/2Hp8lDHL6Azccoxd3l
 xC3eS8cNl1X47iBtNvVYIMMIi5cVpByx1EvmSex4VUWFBcS0D1ykSL18hzPp0M1r2wcuK3
 wyKZchQYz6JtOPWu2IJc6KTb53P++OHPSJR/H67Pugy4fhKwKKmsHaJ5VS3lUXaQPdCcGc
 mnb3utxSXEpFpHVH/0hu9mWOczMWwfUw0kntq5+bTLqYhc62WZDJyVShlgm/QmTNJm8y33
 zA0W+3jsGP9GEnC0AmIyXfTZTmgrGia8J1urCIv1acmsTSPVrXFR3VBELArx3w==
X-Envelope-To: dri-devel@lists.freedesktop.org
Date: Mon, 20 May 2024 14:25:09 -0700
Message-ID: <20240520142509.GD4646@craftyguy.net>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Clayton Craft <clayton@craftyguy.net>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/panel-edp: Add entry for BOE NV133WUM-N63 panel
In-Reply-To: <ch3czbfe4zbpm7z25bdia7ctqezydo74yjyi5cq36o2vylawu4@ejymsxq63s6a>
References: <CAA8EJpoobfosRMMNm2uDY3dNXgCU+LauRvg9-2MrQBwHO0q1Cg@mail.gmail.com>
 <20240520200611.6279-1-clayton@craftyguy.net>
 <ch3czbfe4zbpm7z25bdia7ctqezydo74yjyi5cq36o2vylawu4@ejymsxq63s6a>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="uHQYnKecE+ykce0K";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uHQYnKecE+ykce0K
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gVHVlLCAyMSBNYXkgMjAyNCAwMDowNzowNCArMDMwMCBEbWl0cnkgQmFyeXNoa292IDxkbWl0
cnkuYmFyeXNoa292QGxpbmFyby5vcmc+IHdyb3RlOgo+IE9uIE1vbiwgTWF5IDIwLCAyMDI0IGF0
IDAxOjA2OjAwUE0gLTA3MDAsIENsYXl0b24gQ3JhZnQgd3JvdGU6Cj4gPiBUaGlzIHBhbmVsIGlz
IGZvdW5kIG9uIHNvbWUgbGFwdG9wcyBlLmcuLCB2YXJpYW50cyBvZiB0aGUgVGhpbmtwYWQgWDEz
cy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQ2xheXRvbiBDcmFmdCA8Y2xheXRvbkBjcmFmdHln
dXkubmV0Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWVkcC5jIHwg
MSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gUGxlYXNlIGRvbid0
IHNlbmQgcGF0Y2hlcyBhcyBhIHJlc3BvbnNlIHRvIG90aGVyIG1haWxzIGFuZCBhbHNvIHBsZWFz
ZQo+IGtlZXAgdmVyc2lvbmluZyBjb25zaXN0ZW50LiBUaGlzIHNob3VsZCBoYXZlIGJlZW4gdjMu
CgpVbmRlcnN0b29kLCBhbmQgSSdtIHNvcnJ5IGZvciB0aGUgbWlzdGFrZXMuIEkgd2lsbCByZXNl
bmQgaXQgYXMgVjMuCgotQ2xheXRvbgo=

--uHQYnKecE+ykce0K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEkdOrrjmBP3eB7DeWSkztbX7flQoFAmZLv7UACgkQSkztbX7f
lQq/Jw//TkCUi+gXaV70C7xHjtKnG9xUnFwbSn5aWSH+FkBmAJa3nagAVVV1C2p+
eipn+cFDi3tXHEf24rxtpYFfVWwbzQaLoK0iDWRkovGr8wJCUgI3LFZgTVKP6WZ1
qMX2EbnUR5wdieqo08fU6xKjD7V3HqwpV+JcN0xNehFGzaUrEAzmCgPQbyxEdi5/
E+3C4fb2PtAyhC0qI5bL8nID6pf1XnJOqfdZtDYW+Vq5JQSFuEyxBet//8CWfwGN
fI2FPcRQaSRDKjZRiJ5QkyT5TgUt+8gcLOtOVsYsXyYPTSzdcUllRIYgN6HxtvZO
CH5vfjJMbWkDpKjUB+FM8mRkpsWQ1tI2ySs3gfaWLgchAebbs5+fhTpNxzCIwlbc
ugOi81yZtnGSj8JNBatEDWJrPUsKGa/JHfryYcGSGIpMMNgqts/+fT8iwXxSBeCx
xPoSNDLaYO84janoMm6q21jp8q/d+rQ2OyT/B8KfNk04d0lf2iUSQ7mCzC4ZKP+1
onbI2uO8pg28GZTLcwf2Hp+/sP4MSw7sjKx8OQv03bgP93MP8G9goF/voqpQXUX1
cDGSLi8ghxj3OpDvkio7pxVN0kiTlHkhpkPjDSkp82QXPNHMjcHkAXxn2++9tPDS
0NyPVUa1cNNb4sKCNwv7VQ5V8zWI/RgQKD2IY+Pki+xQwmADyLU=
=9O01
-----END PGP SIGNATURE-----

--uHQYnKecE+ykce0K--
