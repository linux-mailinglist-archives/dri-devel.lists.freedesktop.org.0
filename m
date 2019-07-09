Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C36163644
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 14:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0C3897D0;
	Tue,  9 Jul 2019 12:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud7.xs4all.net (lb3-smtp-cloud7.xs4all.net
 [194.109.24.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F9F897D0
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 12:56:05 +0000 (UTC)
Received: from [IPv6:2001:983:e9a7:1:10f:829c:8d05:60ea]
 ([IPv6:2001:983:e9a7:1:10f:829c:8d05:60ea])
 by smtp-cloud7.xs4all.net with ESMTPA
 id kpf6hlZDg0SBqkpf9h2mdZ; Tue, 09 Jul 2019 14:56:04 +0200
Subject: Re: [PATCH 2/9] v4l: Add definitions for missing 16-bit RGB4444
 formats
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20190328070723.26553-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190328070723.26553-3-laurent.pinchart+renesas@ideasonboard.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <da6f3198-98e3-a6ae-f6a3-4fc2d82db833@xs4all.nl>
Date: Tue, 9 Jul 2019 14:56:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190328070723.26553-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfKfmxBTKXNZweMrFwXst2RcJUbet5KbPq3+CwUL8924yE4a/UHLH1MLQNE5YGrImcK0m5CIUygHwee7ybMV6xdQl8I+0J9lgTUk5MgpPOWKvtYzDixED
 +bnsE5+PYjJjSGdbknnI2C2/M1HVbGhsVtVddlWBbwhJzV+2ec8XWEhg2niKs0iOMlbOaqiXNgZ2nB7FzXwuJG8AEwOkbMQ2Vzc7YeNT1eb1YN0hix5jBMDA
 snkGm8dIhhFB4liZ+YsGOrFlOTeP+xQrJ+ISqTvRhwHnPcMZZdWmjgNWp/NF7a3dAmvGRjPeUDsMftchcljsgO2C3FTUCNcdeEzgQfyO3XBkQ/CmVZ+odABO
 CYCWSmiPFZdFGFw4DZvnc+rctSRcSQB7IQh1VmF3nMflGa8N02h6jl9UM0QavLQZMDTfNpq+4gcF3ULhyVBJ/gby4YtU3lLkUY2XV2JbkTaYipy+tYA=
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
Cc: linux-renesas-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCk9uIDMvMjgvMTkgODowNyBBTSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToK
PiBUaGUgVjRMMiBBUEkgaXMgbWlzc2luZyB0aGUgMTYtYml0IFJHQjQ0NDQgZm9ybWF0cyBmb3Ig
dGhlIFJHQkEsIFJHQlgsCj4gQUJHUiwgWEJHUiwgQkdSQSBhbmQgQkdSWCBjb21wb25lbnQgb3Jk
ZXJzLiBBZGQgdGhlbSwgdXNpbmcgdGhlIHNhbWUKPiA0Q0NzIGFzIERSTS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNv
bmJvYXJkLmNvbT4KPiAtLS0KPiAgLi4uL21lZGlhL3VhcGkvdjRsL3BpeGZtdC1wYWNrZWQtcmdi
LnJzdCAgICAgIHwgMTM4ICsrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL3VhcGkvbGludXgv
dmlkZW9kZXYyLmggICAgICAgICAgICAgICAgfCAgIDYgKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDE0
NCBpbnNlcnRpb25zKCspCj4gCgo8c25pcD4KCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9s
aW51eC92aWRlb2RldjIuaCBiL2luY2x1ZGUvdWFwaS9saW51eC92aWRlb2RldjIuaAo+IGluZGV4
IDRlNTIyMjcyNjcxOS4uZGY5ZmE3OGE2YWI3IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvdWFwaS9s
aW51eC92aWRlb2RldjIuaAo+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92aWRlb2RldjIuaAo+
IEBAIC01MTQsNiArNTE0LDEyIEBAIHN0cnVjdCB2NGwyX3BpeF9mb3JtYXQgewo+ICAjZGVmaW5l
IFY0TDJfUElYX0ZNVF9SR0I0NDQgIHY0bDJfZm91cmNjKCdSJywgJzQnLCAnNCcsICc0JykgLyog
MTYgIHh4eHhycnJyIGdnZ2diYmJiICovCj4gICNkZWZpbmUgVjRMMl9QSVhfRk1UX0FSR0I0NDQg
djRsMl9mb3VyY2MoJ0EnLCAnUicsICcxJywgJzInKSAvKiAxNiAgYWFhYXJycnIgZ2dnZ2JiYmIg
Ki8KPiAgI2RlZmluZSBWNEwyX1BJWF9GTVRfWFJHQjQ0NCB2NGwyX2ZvdXJjYygnWCcsICdSJywg
JzEnLCAnMicpIC8qIDE2ICB4eHh4cnJyciBnZ2dnYmJiYiAqLwo+ICsjZGVmaW5lIFY0TDJfUElY
X0ZNVF9SR0JBNDQ0IHY0bDJfZm91cmNjKCdSJywgJ0EnLCAnMScsICcyJykgLyogMTYgIHJycnJn
Z2dnIGJiYmJhYWFhICovCj4gKyNkZWZpbmUgVjRMMl9QSVhfRk1UX1JHQlg0NDQgdjRsMl9mb3Vy
Y2MoJ1InLCAnWCcsICcxJywgJzInKSAvKiAxNiAgcnJycmdnZ2cgYmJiYnh4eHggKi8KPiArI2Rl
ZmluZSBWNEwyX1BJWF9GTVRfQUJHUjQ0NCB2NGwyX2ZvdXJjYygnQScsICdCJywgJzEnLCAnMicp
IC8qIDE2ICBhYWFhYmJiYiBnZ2dncnJyciAqLwo+ICsjZGVmaW5lIFY0TDJfUElYX0ZNVF9YQkdS
NDQ0IHY0bDJfZm91cmNjKCdYJywgJ0InLCAnMScsICcyJykgLyogMTYgIHh4eHhiYmJiIGdnZ2dy
cnJyICovCj4gKyNkZWZpbmUgVjRMMl9QSVhfRk1UX0JHUkE0NDQgdjRsMl9mb3VyY2MoJ0InLCAn
QScsICcxJywgJzInKSAvKiAxNiAgYmJiYmdnZ2cgcnJycmFhYWEgKi8KCkhtbSwgJ0JBMTInIGNs
YXNoZXMgd2l0aCBWNEwyX1BJWF9GTVRfU0dSQkcxMiB3aGljaCBoYXMgdGhlIHNhbWUgZm91cmNj
LgpUaGF0IGZvdXJjYyBtYWtlcyBubyBzZW5zZSBmb3IgVjRMMl9QSVhfRk1UX1NHUkJHMTIgYW5k
IEkgc3VzcGVjdCBpdCB3YXMKYSBtaXN0YWtlLCBidXQgaXQncyBiZWVuIGluIHVzZSBzaW5jZSAy
MDE0LgoKSSB0aGluayBWNEwyX1BJWF9GTVRfQkdSQTQ0NCBzaG91bGQgZ2V0IGEgZGlmZmVyZW50
IGZvdXJjYyBhbmQgYmUgYmFja3BvcnRlZCB0byA1LjIuCgpDYW4geW91IGFkZHJlc3MgdGhpcyBp
c3N1ZT8KClJlZ2FyZHMsCgoJSGFucwoKPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfQkdSWDQ0NCB2
NGwyX2ZvdXJjYygnQicsICdYJywgJzEnLCAnMicpIC8qIDE2ICBiYmJiZ2dnZyBycnJyeHh4eCAq
Lwo+ICAjZGVmaW5lIFY0TDJfUElYX0ZNVF9SR0I1NTUgIHY0bDJfZm91cmNjKCdSJywgJ0cnLCAn
QicsICdPJykgLyogMTYgIFJHQi01LTUtNSAgICAgKi8KPiAgI2RlZmluZSBWNEwyX1BJWF9GTVRf
QVJHQjU1NSB2NGwyX2ZvdXJjYygnQScsICdSJywgJzEnLCAnNScpIC8qIDE2ICBBUkdCLTEtNS01
LTUgICovCj4gICNkZWZpbmUgVjRMMl9QSVhfRk1UX1hSR0I1NTUgdjRsMl9mb3VyY2MoJ1gnLCAn
UicsICcxJywgJzUnKSAvKiAxNiAgWFJHQi0xLTUtNS01ICAqLwo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
