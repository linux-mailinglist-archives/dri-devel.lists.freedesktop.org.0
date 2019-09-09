Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DBDAD93A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 14:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEDF8989A;
	Mon,  9 Sep 2019 12:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id DCA158989A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 12:40:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D7E5C72168; Mon,  9 Sep 2019 12:40:25 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109303] [CI][SHARDS]
 igt@i915_query@query-topology-known-pci-ids - skip - Test requirement:
 IS_HASWELL(devid) || IS_BROADWELL(devid) || IS_SKYLAKE(devid) ||
 IS_KABYLAKE(devid) || IS_COFFEELAKE(devid), SKIP
Date: Mon, 09 Sep 2019 12:40:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cibuglog@gmail.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: NOTABUG
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109303-502-SzZQI7PG3j@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109303-502@http.bugs.freedesktop.org/>
References: <bug-109303-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0564140696=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0564140696==
Content-Type: multipart/alternative; boundary="15680328251.a1538c.15993"
Content-Transfer-Encoding: 7bit


--15680328251.a1538c.15993
Date: Mon, 9 Sep 2019 12:40:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109303

--- Comment #6 from CI Bug Log <cibuglog@gmail.com> ---
A CI Bug Log filter associated to this bug has been updated:

{- CML ICL: igt@i915_query@query-topology-known-pci-ids - skip - Test
requirement: IS_HASWELL(devid) || IS_BROADWELL(devid) || IS_SKYLAKE(devid) =
||
-}
{+ CML ICL TGL: igt@i915_query@query-topology-known-pci-ids - skip - Test
requirement: IS_HASWELL(devid) || IS_BROADWELL(devid) || IS_SKYLAKE(devid) =
||
+}

New failures caught by the filter:

  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_362/fi-tgl-u/igt@i915_query=
@query-topology-known-pci-ids.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_363/fi-tgl-u/igt@i915_query=
@query-topology-known-pci-ids.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_364/fi-tgl-u/igt@i915_query=
@query-topology-known-pci-ids.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15680328251.a1538c.15993
Date: Mon, 9 Sep 2019 12:40:25 +0000
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
          bz_status_CLOSED  bz_closed"
   title=3D"CLOSED NOTABUG - [CI][SHARDS] igt&#64;i915_query&#64;query-topo=
logy-known-pci-ids - skip - Test requirement: IS_HASWELL(devid) || IS_BROAD=
WELL(devid) || IS_SKYLAKE(devid) || IS_KABYLAKE(devid) || IS_COFFEELAKE(dev=
id), SKIP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109303#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_CLOSED  bz_closed"
   title=3D"CLOSED NOTABUG - [CI][SHARDS] igt&#64;i915_query&#64;query-topo=
logy-known-pci-ids - skip - Test requirement: IS_HASWELL(devid) || IS_BROAD=
WELL(devid) || IS_SKYLAKE(devid) || IS_KABYLAKE(devid) || IS_COFFEELAKE(dev=
id), SKIP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109303">bug 10930=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cibuglog&#64;gmail.com" title=3D"CI Bug Log &lt;cibuglog&#64;gmail.com&gt;"=
> <span class=3D"fn">CI Bug Log</span></a>
</span></b>
        <pre>A CI Bug Log filter associated to this bug has been updated:

{- CML ICL: igt&#64;i915_query&#64;query-topology-known-pci-ids - skip - Te=
st
requirement: IS_HASWELL(devid) || IS_BROADWELL(devid) || IS_SKYLAKE(devid) =
||
-}
{+ CML ICL TGL: igt&#64;i915_query&#64;query-topology-known-pci-ids - skip =
- Test
requirement: IS_HASWELL(devid) || IS_BROADWELL(devid) || IS_SKYLAKE(devid) =
||
+}

New failures caught by the filter:

  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_362/fi-tgl-u/igt=
&#64;i915_query&#64;query-topology-known-pci-ids.html">https://intel-gfx-ci=
.01.org/tree/drm-tip/drmtip_362/fi-tgl-u/igt&#64;i915_query&#64;query-topol=
ogy-known-pci-ids.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_363/fi-tgl-u/igt=
&#64;i915_query&#64;query-topology-known-pci-ids.html">https://intel-gfx-ci=
.01.org/tree/drm-tip/drmtip_363/fi-tgl-u/igt&#64;i915_query&#64;query-topol=
ogy-known-pci-ids.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_364/fi-tgl-u/igt=
&#64;i915_query&#64;query-topology-known-pci-ids.html">https://intel-gfx-ci=
.01.org/tree/drm-tip/drmtip_364/fi-tgl-u/igt&#64;i915_query&#64;query-topol=
ogy-known-pci-ids.html</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15680328251.a1538c.15993--

--===============0564140696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0564140696==--
