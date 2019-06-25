Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E80525D3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 10:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327336E087;
	Tue, 25 Jun 2019 08:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0FB7E6E087;
 Tue, 25 Jun 2019 08:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 2ECC82A6046;
 Tue, 25 Jun 2019 10:02:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id yipPP5i60ewE; Tue, 25 Jun 2019 10:02:41 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 65AEB2A6045;
 Tue, 25 Jun 2019 10:02:41 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hfgPX-0007vW-UL; Tue, 25 Jun 2019 10:02:39 +0200
Subject: Re: [PATCH libdrm 0/9] amdgpu:
To: christian.koenig@amd.com
References: <20190624165406.13682-1-michel@daenzer.net>
 <b48aae10-c1db-b76b-ddde-9c0a47028633@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Openpgp: preference=signencrypt
Autocrypt: addr=michel@daenzer.net; prefer-encrypt=mutual; keydata=
 mQGiBDsehS8RBACbsIQEX31aYSIuEKxEnEX82ezMR8z3LG8ktv1KjyNErUX9Pt7AUC7W3W0b
 LUhu8Le8S2va6hi7GfSAifl0ih3k6Bv1Itzgnd+7ZmSrvCN8yGJaHNQfAevAuEboIb+MaVHo
 9EMJj4ikOcRZCmQWw7evu/D9uQdtkCnRY9iJiAGxbwCguBHtpoGMxDOINCr5UU6qt+m4O+UD
 /355ohBBzzyh49lTj0kTFKr0Ozd20G2FbcqHgfFL1dc1MPyigej2gLga2osu2QY0ObvAGkOu
 WBi3LTY8Zs8uqFGDC4ZAwMPoFy3yzu3ne6T7d/68rJil0QcdQjzzHi6ekqHuhst4a+/+D23h
 Za8MJBEcdOhRhsaDVGAJSFEQB1qLBACOs0xN+XblejO35gsDSVVk8s+FUUw3TSWJBfZa3Imp
 V2U2tBO4qck+wqbHNfdnU/crrsHahjzBjvk8Up7VoY8oT+z03sal2vXEonS279xN2B92Tttr
 AgwosujguFO/7tvzymWC76rDEwue8TsADE11ErjwaBTs8ZXfnN/uAANgPLQjTWljaGVsIERh
 ZW56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD6IXgQTEQIAHgUCQFXxJgIbAwYLCQgHAwIDFQID
 AxYCAQIeAQIXgAAKCRBaga+OatuyAIrPAJ9ykonXI3oQcX83N2qzCEStLNW47gCeLWm/QiPY
 jqtGUnnSbyuTQfIySkK5AQ0EOx6FRRAEAJZkcvklPwJCgNiw37p0GShKmFGGqf/a3xZZEpjI
 qNxzshFRFneZze4f5LhzbX1/vIm5+ZXsEWympJfZzyCmYPw86QcFxyZflkAxHx9LeD+89Elx
 bw6wT0CcLvSv8ROfU1m8YhGbV6g2zWyLD0/naQGVb8e4FhVKGNY2EEbHgFBrAAMGA/0VktFO
 CxFBdzLQ17RCTwCJ3xpyP4qsLJH0yCoA26rH2zE2RzByhrTFTYZzbFEid3ddGiHOBEL+bO+2
 GNtfiYKmbTkj1tMZJ8L6huKONaVrASFzLvZa2dlc2zja9ZSksKmge5BOTKWgbyepEc5qxSju
 YsYrX5xfLgTZC5abhhztpYhGBBgRAgAGBQI7HoVFAAoJEFqBr45q27IAlscAn2Ufk2d6/3p4
 Cuyz/NX7KpL2dQ8WAJ9UD5JEakhfofed8PSqOM7jOO3LCA==
Message-ID: <6e737397-9b3d-b66c-7948-59b5acdbca60@daenzer.net>
Date: Tue, 25 Jun 2019 10:02:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <b48aae10-c1db-b76b-ddde-9c0a47028633@gmail.com>
Content-Language: en-CA
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0yNCA3OjMxIHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gUGF0Y2hl
cyAjMSAtICMzIGxvb2sgZ29vZCB0byBtZSwgYnV0IEknbSBub3Qgc3VyZSBpZiB0aGUgcmVzdCBp
cyBzdWNoIGEKPiBnb29kIGlkZWEuCj4gCj4gQmFzaWNhbGx5IHlvdSBub3Qgb25seSB3YW50IHRv
IHVzZSB0aGUgc2FtZSBGRCBmb3IgQ1MsIGJ1dCBhbHNvIGZvcgo+IGJhc2ljYWxseSBhbGwgYnVm
ZmVyIGZ1bmN0aW9ucyBhbmQgYXMgZmFyIGFzIEkgY2FuIHNlZSB3ZSBicmVhayB0aGF0IGhlcmUu
CgpIb3cgc28/IFRoZSBjb3JlIEZEIGlzIHVzZWQgZm9yIGV2ZXJ5dGhpbmcgZXhjZXB0IGZsaW5r
IGFuZAphbWRncHVfYm9faGFuZGxlX3R5cGVfa21zX3VzZXIuCgoKPiBJIHdvdWxkIHJhdGhlciBh
ZGQgYSBuZXcgZnVuY3Rpb24gdG8gZXhwb3J0IHRoZSBLTVMgaGFuZGxlIGZvciBhIGNlcnRhaW4K
PiBCTy9GRCBwYWlyLiBFeHBvcnRpbmcgdGhlIGhhbmRsZSBiYXNlZCBvbiBhIHR5cGUgd2FzIGFs
c28gbGlrZSB0cnlpbmcgdG8KPiBzcXVlZXplIGEgcm91bmQgcGlnIHRocm91Z2ggYSBzcXVhcmUg
aG9sZSBpbiB0aGUgZmlyc3QgcGxhY2UuCj4gCj4gS01TLCBmbGluayBhbmQgRE1BLWJ1ZiBmZCBh
cmUgZnVuZGFtZW50YWxseSBkaWZmZXJlbnQgYW5kIHNob3VsZG4ndCBiZQo+IGhhbmRsZWQgYnkg
dGhlIHNhbWUgZnVuY3Rpb24gaW4gdGhlIGZpcnN0IHBsYWNlLgoKSSBkb24ndCByZWFsbHkgc2Vl
IHRoZSBwcm9ibGVtLiByYWRlb25zaSAmIFJBRFYgYXJlIHVzaW5nCmFtZGdwdV9ib19oYW5kbGVf
dHlwZV9rbXMgdG8gZ2V0IGhhbmRsZXMgZm9yIGNvbW1hbmQgc3RyZWFtIHN1Ym1pc3Npb24sCnNv
IHRob3NlIGhhbmRsZXMgaGF2ZSB0byBiZSB2YWxpZCBmb3IgdGhlIGNvcmUgRkQuIE5vdyB0aGVy
ZSdzCmFtZGdwdV9ib19oYW5kbGVfdHlwZV9rbXNfdXNlciB0byBnZXQgYSBoYW5kbGUgdmFsaWQg
Zm9yIHRoZSBGRCBwYXNzZWQKdG8gYW1kZ3B1X2RldmljZV9pbml0aWFsaXplLiBDYW4geW91IGRl
c2NyaWJlIGEgc2NlbmFyaW8gd2hlcmUgYSBoYW5kbGUKdmFsaWQgZm9yIHlldCBhbm90aGVyIGZp
bGUgZGVzY3JpcHRpb24gaXMgbmVlZGVkPwoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIg
ICAgICAgICAgICAgICB8ICAgICAgICAgICAgICBodHRwczovL3d3dy5hbWQuY29tCkxpYnJlIHNv
ZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRl
dmVsb3BlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
