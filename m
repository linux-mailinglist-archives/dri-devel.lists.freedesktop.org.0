Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349BA74827
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29C76E67E;
	Thu, 25 Jul 2019 07:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 306 seconds by postgrey-1.36 at gabe;
 Thu, 25 Jul 2019 07:27:38 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C63E6E639
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 07:27:38 +0000 (UTC)
Received: from [192.168.1.110] ([77.9.64.13]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MsqMq-1ifCnO1BAu-00t9wS; Thu, 25 Jul 2019 09:22:30 +0200
Subject: Re: AMD Drivers
To: Gilberto Nunes <gilberto.nunes32@gmail.com>,
 linux-kernel@vger.kernel.org, dri devel <dri-devel@lists.freedesktop.org>
References: <CAOKSTBs-cHMr7xbJVVUjZ9C3__bY6jZU-_TZ0RmMRMJ3dBk3PA@mail.gmail.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <0c3f445d-1e37-1531-d3d5-f7ad75c58343@metux.net>
Date: Thu, 25 Jul 2019 09:22:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAOKSTBs-cHMr7xbJVVUjZ9C3__bY6jZU-_TZ0RmMRMJ3dBk3PA@mail.gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:659jE6DNqxATIz6lVOvFCp//CjtOqPsWVkvHo3c2gH0Z9BnolE/
 7E02SQSPqT3EXNqNqKQHpo9pNLqXIrjBLgSZ35p+FLFj+9uAfcE3s3uxpjCwEddXW2lT8TA
 zYUuGjfQoU+DSlVeX8Y797vlaJys0GJbU4Ouf5kTCaaBngNL1leKjiWEVwEvnXd1gP2EVNb
 ByFNaTu55yZ7orXAW9hfg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8bPj3EWB3aE=:JweCz6YfDlQScUN44FdnEV
 DWYFQLeoEvkHjARk4wI5UzF3T9kgi02Ho/B+2XeQe8kH6t91+AjtsuQgbE6rg2OefhLvTX/4R
 rq0Ir7wqgoPshyK10v/RtkgqjKU1UgpA/b5cAAqX3EruQGMe7HyynXPYOExH4tu6S94UcB0t1
 h9bvDnhWV3INoSadrX3/rhFYNBOxStAGAE+4imPQL6p2QbJvRmVGFebMoLn480K4ukSp4tIMc
 G8GBkrfws1TifEj4RTNV+U54t+MVIdrOQ/FE14Z2i4ecknOZ9FcoWJZPalMOBMyNBk9AcrYz8
 /0DRdnJLZ0xtJFYvNSyaCkreUMzq/4fxFb9BaGm+SwWm0UP8eR0duQtk5JT1GXv3YnAqsDdkH
 HULxa3YYGX1FS2MbKGtyUhqjYW5PmVoZXeuWgKoJLplv2jv0qeQoB1BJ7cm68I5Lj/m0SJvUk
 oQessyIzhJ8MdW7FHtFokTdSkmmB+Xzg7DlXJWJ+k4lG2Q1+lkmzhy5A7igvlAxi4O/pwP1gK
 6m3cixn/E/MU1fDmD4gZ9ThHWqAv0sbOvpSWntdn7WXSW4tXogjJCIRQFgskjFod/EPc8+cEI
 Zy3eFcBafbkCcQJ3lvdodo1gJEwuddwSgOlMFVFB1fh5GAtdcSxufJCFUfxk+3Rbdn6p1R5cC
 T+cp1PQjwhTJDtPoNP12xLSgdmCVkr0o+QtaUOy1qx1qi+Vv025cjqS0JVFwXWUz5NQb8+kgd
 nbE2nXp6F+MxFbJJ52xK8AK+a81z/JYpazfBFzTtz/TtvthEr9dzrFPm3ls=
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjQuMDcuMTkgMTY6MTcsIEdpbGJlcnRvIE51bmVzIHdyb3RlOgoKSGksCgpjcm9zc3Bvc3Rp
bmcgdG8gZHJpLWRldmVsLCBhcyBpdCBzbWVsbHMgbGlrZSBhIHByb2JsZW0gdy8gYW1kZ3B1IGRy
aXZlci4KCj4gQ1BVIC0gQU1EIEExMi05NzIwUCBSQURFT04gUjcsIDEyIENPTVBVVEUgQ09SRVMg
NEMrOEcKPiBHUFUgLSBXYW5pIFtSYWRlb24gUjUvUjYvUjcgR3JhcGhpY3NdIChhbWRncHUpCj4g
TmV0d29yayBJbnRlcmZhY2UgY2FyZDoKPiAwMTowMC4xIEV0aGVybmV0IGNvbnRyb2xsZXI6IFJl
YWx0ZWsgU2VtaWNvbmR1Y3RvciBDby4sIEx0ZC4KPiBSVEw4MTExLzgxNjgvODQxMSBQQ0kgRXhw
cmVzcyBHaWdhYml0IEV0aGVybmV0IENvbnRyb2xsZXIgKHJldiAxMikKPiAKPiBXaGVuIEkgaW5z
dGFsbCBrZXJuZWwgNC4xOC54IG9yIDUueCwgdGhlIG5ldHdvcmsgZG9lc24ndCB3b3JrIGFueW1v
cmUuLi4KCldoYXQgYWJvdXQgb3RoZXIgdmVyc2lvbnMgKGVnLiB2NC4xOSkgPwpXaGljaCBpcyB0
aGUgbGFzdCB3b3JraW5nIHZlcnNpb24gPwoKPiBJIGNhbiBsb2FkZWQgdGhlIG1vZHVsbyByODE2
OSBhbmRyODE2OC4KPiBJIHNhdyBlbnAxczBmMSBhcyB3ZWxsIGJ1dCB0aGVyZSdzIG5vIGxpbmsg
YXQgYWxsIQo+IEV2ZW4gd2hlbiBJIGZpeGVkIHRoZSBJUCBub25lIGxpbmshCj4gSSBjYW5ub3Qg
cGluZyB0aGUgbmV0d29yayBnYXRld2F5IG9yIGFueSBvdGhlciBJUCBpbnNpZGUgTEFOIQo+IFJp
Z2h0IG5vdywgSSBib290ZWQgbXkgbGFwdG9wIHdpdGgga2VybmVsCj4gTGludXggdmVyc2lvbiA1
LjIuMi0wNTAyMDItZ2VuZXJpYyAoa2VybmVsQGthdGhsZWVuKSAoZ2NjIHZlcnNpb24KPiA5LjEu
MCAoVWJ1bnR1IDkuMS4wLTl1YnVudHUyKSkgIzIwMTkwNzIzMTI1MCBTTVAgVHVlIEp1bCAyMyAx
Mjo1MzoyMQo+IFVUQyAyMDE5CgpDb3VsZCB5b3UgYWxzbyB0cnkgNS4zID8KCj4gVGhlIHN5c3Rl
bSBib290IHNsb3dseSwgYW5kIEkgaGF2ZSBhIFNTRCBTYW1zdW5nLCB3aGljaCBpbiBrZXJuZWwK
PiA0LjE1LCBib290IHF1aWNrbHkuCj4gQW5kIHRoZXJlJ3MgbWFueSBlcnJvcnMgaW4gZG1lc2cg
Y29tbWFuZCwgbGlrZSB5b3UgY2FuIHNlZSBpbiB0aGlzIHBhc3RiaW4KPiAKPiBodHRwczovL3Bh
c3RlLnVidW50dS5jb20vcC9ZaGJqbnpZWVloLwoKbG9va3MgbGlrZSBzb21ldGhpbmcncyB3cm9u
ZyB3LyByZWFkaW5nIGdwdSByZWdpc3RlcnMgKG1vcmUgcHJlY2lzZWx5CndhaXRpbmcgZm9yIHNv
bWUgY2hhbmdpbmcpLCB0aGF0J3MgY2F1c2luZyB0aGUgc29mdCBsb2NrdXAuIChtYXliZSB0b28K
YmlnIHRpbWVvdXQgPykKCj4gT2ghIEJ5IHRoZSB3YXksIHRoZSBuZXR3b3JrIGNhcmQgcjgxNjkg
YXJlIHdvcmsgd29uZGVyZnVsIQoKRGlkbid0IHlvdSBzYXkgKGFib3ZlKSB0aGF0IGl0IGRvZXMg
bm90IHdvcmsgPwpPciBpcyBpdCBqdXN0IGFuIGltbWVkaWF0ZSBmYWlsIGFuZCBsYXRlciBjb21l
cyBiYWNrID8KCgotLW10eAoKCi0tIApFbnJpY28gV2VpZ2VsdCwgbWV0dXggSVQgY29uc3VsdApG
cmVlIHNvZnR3YXJlIGFuZCBMaW51eCBlbWJlZGRlZCBlbmdpbmVlcmluZwppbmZvQG1ldHV4Lm5l
dCAtLSArNDktMTUxLTI3NTY1Mjg3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
