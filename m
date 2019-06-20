Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C021F4CF05
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 15:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32EB6E525;
	Thu, 20 Jun 2019 13:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 44E416E579
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 13:38:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 424EA72167; Thu, 20 Jun 2019 13:38:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109887] vega56 undervolting/overclocking voltage issues
Date: Thu, 20 Jun 2019 13:38:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hagar-dunor@wanadoo.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109887-502-aXIIl9r2TM@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109887-502@http.bugs.freedesktop.org/>
References: <bug-109887-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============0423723898=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0423723898==
Content-Type: multipart/alternative; boundary="15610379191.fffb.9797"
Content-Transfer-Encoding: 7bit


--15610379191.fffb.9797
Date: Thu, 20 Jun 2019 13:38:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109887

--- Comment #7 from hagar-dunor <hagar-dunor@wanadoo.fr> ---
Met the same annoyance, and found a rather convoluted way to get around it.=
 It
would be better overclocking/undervolting work by setting pp_od_clk_voltage
only.

https://forum.level1techs.com/t/how-to-overclock-vega-on-linux/132771/65

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15610379191.fffb.9797
Date: Thu, 20 Jun 2019 13:38:39 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - vega56 undervolting/overclocking voltage issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109887#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - vega56 undervolting/overclocking voltage issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109887">bug 10988=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hagar-dunor&#64;wanadoo.fr" title=3D"hagar-dunor &lt;hagar-dunor&#64;wanado=
o.fr&gt;"> <span class=3D"fn">hagar-dunor</span></a>
</span></b>
        <pre>Met the same annoyance, and found a rather convoluted way to g=
et around it. It
would be better overclocking/undervolting work by setting pp_od_clk_voltage
only.

<a href=3D"https://forum.level1techs.com/t/how-to-overclock-vega-on-linux/1=
32771/65">https://forum.level1techs.com/t/how-to-overclock-vega-on-linux/13=
2771/65</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15610379191.fffb.9797--

--===============0423723898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0423723898==--
