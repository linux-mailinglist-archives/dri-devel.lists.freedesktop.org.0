Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8A156425
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8216E2E6;
	Wed, 26 Jun 2019 08:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net
 [194.109.24.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673DB6E11E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 14:28:31 +0000 (UTC)
Received: from [IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b]
 ([IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b])
 by smtp-cloud9.xs4all.net with ESMTPA
 id fmQshQq3NSfvXfmQvhHlIE; Tue, 25 Jun 2019 16:28:29 +0200
Subject: Re: [PATCHv8 04/13] cec: expose the new connector info API
To: Dariusz Marcinkiewicz <darekm@google.com>
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
 <20190624160330.38048-5-hverkuil-cisco@xs4all.nl>
 <CALFZZQHLz6jV95NRMrbOdpu1oNh=KCrNpC+t2YiL-8MAUi0dTQ@mail.gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <7b0d4161-8721-5e97-13a6-86274a479314@xs4all.nl>
Date: Tue, 25 Jun 2019 16:28:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CALFZZQHLz6jV95NRMrbOdpu1oNh=KCrNpC+t2YiL-8MAUi0dTQ@mail.gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfDn6A1IzA5i/k49nc6h+5f1MJI4kdKyWS0J+bkmSvG+TsMkTkMEq9i33LPv4RAfEuvtVARZLNHpqqouUC/6nI6GXBQ07PA4z4j97LsMTPhyUJQUH+Aq4
 36YiUe0HL8i31HE6z9Wtb3eMotM1lJIQ4iun5I1iYnkL/rO/fgtNG8uyI6EPsjV8IKcKmrCCvHE2dLciRjCCu0RwkwcrUNZ3LNx3pMKbq/B96JRR6BbB/Fes
 nvRA29Uj/Y5K8W6YfxCOd/rD2LQwkvYv5G3ydRZCn51oO8gAIXcPSpUvP6sWy96oIW59S54b+kKDz30HeMheH++NSGkOrGx96GBAebh0vryfvWSVvbd/i4HE
 Yz8wxNaNDwT+Dc+DqLhbiDH27flWa2afqkH9WN/iG0Iv7ieITRo=
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
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
Cc: Cheng-yi Chiang <cychiang@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8yNS8xOSAzOjU5IFBNLCBEYXJpdXN6IE1hcmNpbmtpZXdpY3ogd3JvdGU6Cj4gSGkuCj4g
Cj4gVGhpcyBsb29rcyBnb29kIGV4Y2VwdCBvbmUgY29tbWVudCBhYm91dCB0aGUgaW9jdGwuCj4g
Cj4gT24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgNjowMyBQTSBIYW5zIFZlcmt1aWwgPGh2ZXJrdWls
LWNpc2NvQHhzNGFsbC5ubD4gd3JvdGU6Cj4+Cj4gLi4uCj4+ICtzdGF0aWMgbG9uZyBjZWNfYWRh
cF9nX2Nvbm5lY3Rvcl9pbmZvKHN0cnVjdCBjZWNfYWRhcHRlciAqYWRhcCwKPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgY2VjX2xvZ19hZGRycyBfX3VzZXIg
KnBhcmcpCj4+ICt7Cj4+ICsgICAgICAgaWYgKCEoYWRhcC0+Y2FwYWJpbGl0aWVzICYgQ0VDX0NB
UF9DT05ORUNUT1JfSU5GTykpCj4+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT1RUWTsKPiBJ
IGd1ZXNzIGFjY2VzcyB0byBhZGFwLT5jb25uX2luZm8gbmVlZHMgdG8gYmUgZ3VhcmRlZCBieSB0
aGUgbG9jayBub3cuCgpHb29kIGNhdGNoISBZZXMsIHRoaXMgbmVlZHMgYSBsb2NrLgoKUmVnYXJk
cywKCglIYW5zCgo+IAo+PiArICAgICAgIGlmIChjb3B5X3RvX3VzZXIocGFyZywgJmFkYXAtPmNv
bm5faW5mbywKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihhZGFwLT5jb25uX2lu
Zm8pKSkKPj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUZBVUxUOwo+PiArICAgICAgIHJldHVy
biAwOwo+PiArfQo+IAo+IEJlc3QgcmVnYXJkcy4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
