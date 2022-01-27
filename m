Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3985A49E54D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 15:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BDB10EEEB;
	Thu, 27 Jan 2022 14:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Thu, 27 Jan 2022 10:17:42 UTC
Received: from qq.com (smtpbg414.qq.com [113.96.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA2E10F05F;
 Thu, 27 Jan 2022 10:17:42 +0000 (UTC)
X-QQ-FEAT: 3uawQE1sH+2NMHsuwVTz3HjMNFAs2BHgxZR2UNBQMb3izP+QZkz08G39gXDaZ
 ATUAEhmRkTblsYcJhpXFr8rVBczxaXsPYbdnJMQVIZW/2b7Md7IDLkM+dlFF4wkqBSd9ck1
 UHEBQv6mHlF/2GDaVJ62iJJq8FjqMezBRRLi5+/3cFHLIBavazIwPNRcHEQoy1j5nq01SdO
 FBRVslMvXAn9q00nPLsy9+bl7N75zeigRgawiExwj/IOoA9X0x5k9UL08u9FA1dA8o7Qhfn
 5y5XLiXgrqgb8RYHd/PNJ3wSNgTJa66eqdBHm4+Zsmf+4bDCqS7dlk34j9v7CVPEBuVSfwm
 FgP4GMW9TEhuo1h+JzydN9Ajdk16Q==
X-QQ-SSF: 00400000000000F0
X-QQ-WAPMAIL: 1
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 49.93.64.30
References: <20220127065156.22372-1-tangmeng@uniontech.com>
 <YfJCBZuc9mOZkIVJ@kroah.com> <YfJuoHfKnwm6LmuY@phenom.ffwll.local>
X-QQ-STYLE: 
X-QQ-mid: qyrialogic3t1643278210t579822
From: "=?gb18030?B?zMDDzw==?=" <tangmeng@uniontech.com>
To: "=?gb18030?B?RGFuaWVsIFZldHRlcg==?=" <daniel@ffwll.ch>,
 "=?gb18030?B?R3JlZyBLSA==?=" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drivers: Fix typo in comment
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_61F26F81_1ECF6010_57F21439"
Content-Transfer-Encoding: 8Bit
Date: Thu, 27 Jan 2022 18:10:09 +0800
X-Priority: 3
Message-ID: <tencent_494A6A986E1BE844315F3F5F@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 3914001077
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Thu, 27 Jan 2022 18:10:11 +0800 (CST)
Feedback-ID: qyrialogic:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Thu, 27 Jan 2022 14:57:22 +0000
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
Cc: =?gb18030?B?UGV0ZXIuQ2hlbg==?= <Peter.Chen@nxp.com>,
 =?gb18030?B?YW1kLWdmeA==?= <amd-gfx@lists.freedesktop.org>,
 =?gb18030?B?YWlybGllZA==?= <airlied@linux.ie>,
 =?gb18030?B?ZHJpLWRldmVs?= <dri-devel@lists.freedesktop.org>,
 =?gb18030?B?bGludXgtdXNi?= <linux-usb@vger.kernel.org>,
 =?gb18030?B?bGludXgta2VybmVs?= <linux-kernel@vger.kernel.org>,
 =?gb18030?B?anNhcmhh?= <jsarha@ti.com>,
 =?gb18030?B?dG9taS52YWxrZWluZW4=?= <tomi.valkeinen@ti.com>,
 =?gb18030?B?bGludXg=?= <linux@dominikbrodowski.net>,
 =?gb18030?B?YWxleGFuZGVyLmRldWNoZXI=?= <alexander.deucher@amd.com>,
 =?gb18030?B?Y2hyaXN0aWFuLmtvZW5pZw==?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.

------=_NextPart_61F26F81_1ECF6010_57F21439
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

VGhhbmtzLCBJIGhhdmUgc3BsaXQmbmJzcDtpdC4NCg0KDQoNCiC3otfUztK1xMbz0rXOotDF
ICAgICANCiANCiAmbmJzcDsNCg0KDQogLS0tLS0tLS0tLVJlcGx5IHRvIE1lc3NhZ2UtLS0t
LS0tLS0tDQogT24gVGh1LCBKYW4gMjcsIDIwMjIgMTg6MDYgUE0gRGFuaWVsIFZldHRlcjxk
YW5pZWxAZmZ3bGwuY2gmZ3Q7IHdyb3RlOg0KDQogIE9uJm5ic3A7VGh1LCZuYnNwO0phbiZu
YnNwOzI3LCZuYnNwOzIwMjImbmJzcDthdCZuYnNwOzA3OjU2OjA1QU0mbmJzcDsrMDEwMCwm
bmJzcDtHcmVnJm5ic3A7S0gmbmJzcDt3cm90ZTpGb3ImbmJzcDtkcm0mbmJzcDtwbGVhc2Um
bmJzcDthbHNvJm5ic3A7c3BsaXQmbmJzcDtpdCZuYnNwO3Blci1kcml2ZXIsJm5ic3A7c28m
bmJzcDtvbmUmbmJzcDtwYXRjaCZuYnNwO3BlciZuYnNwO2ZpbGUmbmJzcDt5b3UmbmJzcDtj
aGFuZ2VoZXJlLi1EYW5pZWwtLSZuYnNwO0RhbmllbCZuYnNwO1ZldHRlclNvZnR3YXJlJm5i
c3A7RW5naW5lZXIsJm5ic3A7SW50ZWwmbmJzcDtDb3Jwb3JhdGlvbmh0dHA6Ly9ibG9nLmZm
d2xsLmNoDQomZ3Q7Jm5ic3A7T24mbmJzcDtUaHUsJm5ic3A7SmFuJm5ic3A7MjcsJm5ic3A7
MjAyMiZuYnNwO2F0Jm5ic3A7MDI6NTE6NTZQTSZuYnNwOyswODAwLCZuYnNwO3RhbmdtZW5n
Jm5ic3A7d3JvdGU6DQomZ3Q7Jm5ic3A7Jmd0OyZuYnNwO1JlcGxhY2UmbmJzcDtkaXNiYWxl
Jm5ic3A7d2l0aCZuYnNwO2Rpc2FibGUmbmJzcDthbmQmbmJzcDtyZXBsYWNlJm5ic3A7dW5h
dmFpYmFsZSZuYnNwO3dpdGgmbmJzcDt1bmF2YWlsYWJsZS4NCiZndDsmbmJzcDsmZ3Q7Jm5i
c3A7DQomZ3Q7Jm5ic3A7Jmd0OyZuYnNwO1NpZ25lZC1vZmYtYnk6Jm5ic3A7dGFuZ21lbmcm
bmJzcDs8dGFuZ21lbmdAdW5pb250ZWNoLmNvbSZndDsNCiZndDsmbmJzcDsmZ3Q7Jm5ic3A7
LS0tDQomZ3Q7Jm5ic3A7Jmd0OyZuYnNwOyZuYnNwO2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L214Z3B1X3ZpLmMmbmJzcDt8Jm5ic3A7MiZuYnNwOystDQomZ3Q7Jm5ic3A7Jmd0OyZu
YnNwOyZuYnNwO2RyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX2NydGMuYyZuYnNwOyZu
YnNwO3wmbmJzcDsyJm5ic3A7Ky0NCiZndDsmbmJzcDsmZ3Q7Jm5ic3A7Jm5ic3A7ZHJpdmVy
cy9wY21jaWEvcnNyY19ub25zdGF0aWMuYyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwO3wmbmJzcDsyJm5ic3A7Ky0NCiZndDsmbmJzcDsmZ3Q7Jm5ic3A7Jm5i
c3A7ZHJpdmVycy91c2IvY2hpcGlkZWEvdWRjLmMmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDt8Jm5ic3A7
MiZuYnNwOystDQomZ3Q7Jm5ic3A7Jmd0OyZuYnNwOyZuYnNwOzQmbmJzcDtmaWxlcyZuYnNw
O2NoYW5nZWQsJm5ic3A7NCZuYnNwO2luc2VydGlvbnMoKyksJm5ic3A7NCZuYnNwO2RlbGV0
aW9ucygtKQ0KJmd0OyZuYnNwOw0KJmd0OyZuYnNwO1RoaXMmbmJzcDtuZWVkcyZuYnNwO3Rv
Jm5ic3A7YmUmbmJzcDticm9rZW4mbmJzcDt1cCZuYnNwO3Blci1zdWJzeXN0ZW0sJm5ic3A7
dGhhbmtzLg==

------=_NextPart_61F26F81_1ECF6010_57F21439
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PGRpdj5UaGFua3MsIEkgaGF2ZSBzcGxpdCZuYnNwO2l0LjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+PGhyIHN0eWxlPSJtYXJnaW46IDAgMCAxMHB4IDA7Ym9yZGVyOiAwO2JvcmRlci1i
b3R0b206MXB4IHNvbGlkICNFNkU4RUI7aGVpZ2h0OjA7bGluZS1oZWlnaHQ6MDtmb250LXNp
emU6MDtwYWRkaW5nOiAyMHB4IDAgMCAwO3dpZHRoOiA0MHB4OyI+CjxkaXYgc3R5bGU9ImZv
bnQtZmFtaWx5OiBQaW5nRmFuZyBTQztmb250LXNpemU6IDE2cHg7bGluZS1oZWlnaHQ6IDIy
cHg7Ij48YSBjb250ZW50ZWRpdGFibGU9ImZhbHNlIiBocmVmPSJodHRwczovL3dvcmsud2Vp
eGluLnFxLmNvbS93ZXdvcmtfYWRtaW4vdXNlci9oNS9xcW1haWxfdXNlcl9jYXJkL3ZjMDdi
ZDZiMDdjZTNiMzYxMyIgc3R5bGU9InRleHQtZGVjb3JhdGlvbjogbm9uZTtmb250LXdlaWdo
dDpub3JtYWw7Y29sb3I6ICMyNjdFRjA7Ij63otfUztK1xMbz0rXOotDFPC9hPgogICAgPHA+
IDwvcD4KPGRpdj4mbmJzcDs8L2Rpdj48L2Rpdj48L2Rpdj48ZGl2PjxkaXYgY2xhc3M9Im1h
aWxwbHVnaW5fcXVvdGUiPgo8ZGl2IGNsYXNzPSJtYWlscGx1Z2luX3F1b3RlX3R5cGUiIHN0
eWxlPSJoZWlnaHQ6IDBweDsgY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7IGRpc3BsYXk6IG5v
bmU7Ij4tLS0tLS0tLS0tUmVwbHkgdG8gTWVzc2FnZS0tLS0tLS0tLS08L2Rpdj4KPGRpdiBj
bGFzcz0ibWFpbHBsdWdpbl9xdW90ZV9oZWFkZXIiIHN0eWxlPSJjb2xvcjogcmdiYSgxMSwg
MTcsIDI2LCAwLjYpOyBmb250LWZhbWlseTogUGluZ0ZhbmcgU0M7IGZvbnQtc3R5bGU6IG5v
cm1hbDsgZm9udC13ZWlnaHQ6IG5vcm1hbDsgZm9udC1zaXplOiAxNHB4OyBsaW5lLWhlaWdo
dDogMTUwJTsiPk9uIFRodSwgSmFuIDI3LCAyMDIyIDE4OjA2IFBNIERhbmllbCBWZXR0ZXIm
bHQ7ZGFuaWVsQGZmd2xsLmNoJmd0OyB3cm90ZTo8YnI+PC9kaXY+CjxkaXYgY2xhc3M9Im1h
aWxwbHVnaW5fcXVvdGVfc3BsaXQiIHN0eWxlPSJib3JkZXItbGVmdDogMC41cHggc29saWQg
I0VBRUFFQTsgcGFkZGluZy1sZWZ0OiA5LjVweDsgbWFyZ2luLXRvcDogMTJweDsiPgpPbiZu
YnNwO1RodSwmbmJzcDtKYW4mbmJzcDsyNywmbmJzcDsyMDIyJm5ic3A7YXQmbmJzcDswNzo1
NjowNUFNJm5ic3A7KzAxMDAsJm5ic3A7R3JlZyZuYnNwO0tIJm5ic3A7d3JvdGU6Rm9yJm5i
c3A7ZHJtJm5ic3A7cGxlYXNlJm5ic3A7YWxzbyZuYnNwO3NwbGl0Jm5ic3A7aXQmbmJzcDtw
ZXItZHJpdmVyLCZuYnNwO3NvJm5ic3A7b25lJm5ic3A7cGF0Y2gmbmJzcDtwZXImbmJzcDtm
aWxlJm5ic3A7eW91Jm5ic3A7Y2hhbmdlaGVyZS4tRGFuaWVsLS0mbmJzcDtEYW5pZWwmbmJz
cDtWZXR0ZXJTb2Z0d2FyZSZuYnNwO0VuZ2luZWVyLCZuYnNwO0ludGVsJm5ic3A7Q29ycG9y
YXRpb25odHRwOi8vYmxvZy5mZndsbC5jaDxicj4mZ3Q7Jm5ic3A7T24mbmJzcDtUaHUsJm5i
c3A7SmFuJm5ic3A7MjcsJm5ic3A7MjAyMiZuYnNwO2F0Jm5ic3A7MDI6NTE6NTZQTSZuYnNw
OyswODAwLCZuYnNwO3RhbmdtZW5nJm5ic3A7d3JvdGU6PGJyPiZndDsmbmJzcDsmZ3Q7Jm5i
c3A7UmVwbGFjZSZuYnNwO2Rpc2JhbGUmbmJzcDt3aXRoJm5ic3A7ZGlzYWJsZSZuYnNwO2Fu
ZCZuYnNwO3JlcGxhY2UmbmJzcDt1bmF2YWliYWxlJm5ic3A7d2l0aCZuYnNwO3VuYXZhaWxh
YmxlLjxicj4mZ3Q7Jm5ic3A7Jmd0OyZuYnNwOzxicj4mZ3Q7Jm5ic3A7Jmd0OyZuYnNwO1Np
Z25lZC1vZmYtYnk6Jm5ic3A7dGFuZ21lbmcmbmJzcDsmbHQ7dGFuZ21lbmdAdW5pb250ZWNo
LmNvbSZndDs8YnI+Jmd0OyZuYnNwOyZndDsmbmJzcDstLS08YnI+Jmd0OyZuYnNwOyZndDsm
bmJzcDsmbmJzcDtkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9teGdwdV92aS5jJm5ic3A7
fCZuYnNwOzImbmJzcDsrLTxicj4mZ3Q7Jm5ic3A7Jmd0OyZuYnNwOyZuYnNwO2RyaXZlcnMv
Z3B1L2RybS90aWxjZGMvdGlsY2RjX2NydGMuYyZuYnNwOyZuYnNwO3wmbmJzcDsyJm5ic3A7
Ky08YnI+Jmd0OyZuYnNwOyZndDsmbmJzcDsmbmJzcDtkcml2ZXJzL3BjbWNpYS9yc3JjX25v
bnN0YXRpYy5jJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7fCZu
YnNwOzImbmJzcDsrLTxicj4mZ3Q7Jm5ic3A7Jmd0OyZuYnNwOyZuYnNwO2RyaXZlcnMvdXNi
L2NoaXBpZGVhL3VkYy5jJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7fCZuYnNwOzImbmJzcDsrLTxicj4m
Z3Q7Jm5ic3A7Jmd0OyZuYnNwOyZuYnNwOzQmbmJzcDtmaWxlcyZuYnNwO2NoYW5nZWQsJm5i
c3A7NCZuYnNwO2luc2VydGlvbnMoKyksJm5ic3A7NCZuYnNwO2RlbGV0aW9ucygtKTxicj4m
Z3Q7Jm5ic3A7PGJyPiZndDsmbmJzcDtUaGlzJm5ic3A7bmVlZHMmbmJzcDt0byZuYnNwO2Jl
Jm5ic3A7YnJva2VuJm5ic3A7dXAmbmJzcDtwZXItc3Vic3lzdGVtLCZuYnNwO3RoYW5rcy48
YnI+PGJyPjxicj48YnI+PGJyPjxicj48YnI+PGJyPjxicj4KPC9kaXY+CjwvZGl2Pgo8L2Rp
dj4=

------=_NextPart_61F26F81_1ECF6010_57F21439--



