Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725FE52903
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 12:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C4C6E0BD;
	Tue, 25 Jun 2019 10:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 67FFB6E0BD;
 Tue, 25 Jun 2019 10:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 61DC92AA0A3;
 Tue, 25 Jun 2019 12:07:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id KZQDXSnaYD46; Tue, 25 Jun 2019 12:07:24 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 5AD3E2A6045;
 Tue, 25 Jun 2019 12:07:24 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hfiME-0000ks-JE; Tue, 25 Jun 2019 12:07:22 +0200
Subject: Re: [PATCH libdrm 0/9] amdgpu:
To: "Koenig, Christian" <Christian.Koenig@amd.com>
References: <20190624165406.13682-1-michel@daenzer.net>
 <b48aae10-c1db-b76b-ddde-9c0a47028633@gmail.com>
 <6e737397-9b3d-b66c-7948-59b5acdbca60@daenzer.net>
 <78d5a7c1-8534-7917-58bc-1827dff106c8@amd.com>
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
Message-ID: <dc3a2d63-525b-24ec-72bd-5c2d00d8a36b@daenzer.net>
Date: Tue, 25 Jun 2019 12:07:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <78d5a7c1-8534-7917-58bc-1827dff106c8@amd.com>
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0yNSAxMTo0NCBhLm0uLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToKPiBBbSAy
NS4wNi4xOSB1bSAxMDowMiBzY2hyaWViIE1pY2hlbCBEw6RuemVyOgo+PiBPbiAyMDE5LTA2LTI0
IDc6MzEgcC5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+IFBhdGNoZXMgIzEgLSAjMyBs
b29rIGdvb2QgdG8gbWUsIGJ1dCBJJ20gbm90IHN1cmUgaWYgdGhlIHJlc3QgaXMgc3VjaCBhCj4+
PiBnb29kIGlkZWEuCj4+Pgo+Pj4gQmFzaWNhbGx5IHlvdSBub3Qgb25seSB3YW50IHRvIHVzZSB0
aGUgc2FtZSBGRCBmb3IgQ1MsIGJ1dCBhbHNvIGZvcgo+Pj4gYmFzaWNhbGx5IGFsbCBidWZmZXIg
ZnVuY3Rpb25zIGFuZCBhcyBmYXIgYXMgSSBjYW4gc2VlIHdlIGJyZWFrIHRoYXQgaGVyZS4KPj4g
SG93IHNvPyBUaGUgY29yZSBGRCBpcyB1c2VkIGZvciBldmVyeXRoaW5nIGV4Y2VwdCBmbGluayBh
bmQKPj4gYW1kZ3B1X2JvX2hhbmRsZV90eXBlX2ttc191c2VyLgo+IAo+IElJUkMgaW4gdGhlIE1l
c2Egd2luc3lzIHdlIGNvbXBhcmUgdGhlIGFtZGdwdV9kZXZpY2UgYW5kIGFtZGdwdV9ibyAKPiBw
b2ludGVycyB0byBmaWd1cmUgb3V0IGlmIGFuIG9wZW5lZCBkZXZpY2Ugb3IgaW1wb3J0ZWQgQk8g
aXMgdGhlIHNhbWUgYXMgCj4gb25lIHdlIGFscmVhZHkga25vdy4KPiAKPiBXaXRoIHRoaXMgcGF0
Y2ggdGhhdCB3b24ndCB3b3JrIGFueSBtb3JlIGFuZCBmb3IgZXhhbXBsZSBPcGVuR0wgYW5kIAo+
IFZBLUFQSSBjb3VsZCBwb3RlbnRpYWxseSB1c2Ugc2VwYXJhdGUgYW1kZ3B1X2JvIHBvaW50ZXJz
IGZvciB0aGUgc2FtZSAKPiB1bmRlcmx5aW5nIGJ1ZmZlci4gVGhhdCBpbiB0dXJuIHdvdWxkIGJy
ZWFrIHN5bmNocm9uaXphdGlvbi4KCkhtbSwgSSB3YXMgaG9waW5nIHBhdGNoIDYgd291bGQgY292
ZXIgdGhpcywgYnV0IGl0IGxvb2tzIGxpa2UgT3BlbkdMIGFuZApWQS1BUEkgcGFzcyBmaWxlIGRl
c2NyaXB0b3JzIHJlZmVyZW5jaW5nIGRpZmZlcmVudCBmaWxlIGRlc2NyaXB0aW9ucyB0bwphbWRn
cHVfZGV2aWNlX2luaXRpYWxpemUsIHNvIHlvdSdyZSByaWdodC4gOigKCgo+Pj4gSSB3b3VsZCBy
YXRoZXIgYWRkIGEgbmV3IGZ1bmN0aW9uIHRvIGV4cG9ydCB0aGUgS01TIGhhbmRsZSBmb3IgYSBj
ZXJ0YWluCj4+PiBCTy9GRCBwYWlyLgoKSSdsbCB0cnkgdGhpcyBhcHByb2FjaCB0aGVuLgoKCi0t
IApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICBo
dHRwczovL3d3dy5hbWQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAg
fCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
