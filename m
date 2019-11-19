Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A03CF10279E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 16:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787626E955;
	Tue, 19 Nov 2019 15:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06106E956
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 15:05:19 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAJF4IRD032116
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 15:05:18 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2wa8htqh93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 15:05:18 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAJF3FN2126233
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 15:05:18 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2wc09xhd22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 15:05:17 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAJF5Fu0014413
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 15:05:15 GMT
Received: from dhcp-10-154-111-248.vpn.oracle.com (/10.154.111.248)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 19 Nov 2019 07:05:15 -0800
From: John Donnelly <john.p.donnelly@oracle.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Bugzilla to Gitlabs migration - No email updates ?
Message-Id: <5DE80E82-CE15-4B94-9150-8F474B6F6B59@oracle.com>
Date: Tue, 19 Nov 2019 09:05:13 -0600
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
X-Mailer: Apple Mail (2.3445.9.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9445
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=572
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911190138
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9445
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=643 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911190138
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 to; s=corp-2019-08-05; bh=kyobn6uXKA0o7XuhmPRuF35hclanTVXQYllEgQ2wzZk=;
 b=YSLkpERlLp/o24s12ssGIL3ERAFe5VKMHj+qg0Q0cfsCmrkdyiFlb4MrSw3gsnDnr1Pm
 YXDijOVQajz83EiNm9ig6Dmz55hxtc4WITbe+NB5b0a4CEH2cLz2D49PCE9LceDzQunu
 hWWQ4rvwrzKfPlUBSbvTrVqitQ1p7iuiMNSWBQy0Djgeg7zEgiTz5ANpvY+KuobnGsY8
 cSLCv5oGSJriWLqKttHeS4qriN1KS/6V5/zoWJLduvexewTj0JHi9JhT3CRf2SrwlVAm
 UOyxVKi0/7WAWusZJN25rufQDwzqq2y4UjtRF1eQS+YxPBI0FOMIjVxEtyxHYg45ATSH pQ== 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9lcyBnaXRsYWIgbm90IGdlbmVyYXRlIGVtYWlsIHdoZW4gYSBjb21tZW50IGlzIGFkZGVkIHRv
IGEgdGlja2V0ID8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
