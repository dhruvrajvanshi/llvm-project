; RUN: llc < %s -mtriple=ve-unknown-unknown | FileCheck %s

define i32 @selectcceq(i32, i32, i32, i32) {
; CHECK-LABEL: selectcceq:
; CHECK:       .LBB{{[0-9]+}}_2:
; CHECK-NEXT:    adds.w.sx %s1, %s0, (0)1
; CHECK-NEXT:    adds.w.sx %s2, %s2, (0)1
; CHECK-NEXT:    adds.w.sx %s0, %s3, (0)1
; CHECK-NEXT:    or %s3, 12, (0)1
; CHECK-NEXT:    cmps.w.sx %s1, %s1, %s3
; CHECK-NEXT:    cmov.w.eq %s0, %s2, %s1
; CHECK-NEXT:    or %s11, 0, %s9
  %5 = icmp eq i32 %0, 12
  %6 = select i1 %5, i32 %2, i32 %3
  ret i32 %6
}

define i32 @selectccne(i32, i32, i32, i32) {
; CHECK-LABEL: selectccne:
; CHECK:       .LBB{{[0-9]+}}_2:
; CHECK-NEXT:    adds.w.sx %s1, %s0, (0)1
; CHECK-NEXT:    adds.w.sx %s2, %s2, (0)1
; CHECK-NEXT:    adds.w.sx %s0, %s3, (0)1
; CHECK-NEXT:    or %s3, 12, (0)1
; CHECK-NEXT:    cmps.w.sx %s1, %s1, %s3
; CHECK-NEXT:    cmov.w.ne %s0, %s2, %s1
; CHECK-NEXT:    or %s11, 0, %s9
  %5 = icmp ne i32 %0, 12
  %6 = select i1 %5, i32 %2, i32 %3
  ret i32 %6
}

define i32 @selectccsgt(i32, i32, i32, i32) {
; CHECK-LABEL: selectccsgt:
; CHECK:       .LBB{{[0-9]+}}_2:
; CHECK-NEXT:    adds.w.sx %s1, %s0, (0)1
; CHECK-NEXT:    adds.w.sx %s2, %s2, (0)1
; CHECK-NEXT:    adds.w.sx %s0, %s3, (0)1
; CHECK-NEXT:    or %s3, 12, (0)1
; CHECK-NEXT:    cmps.w.sx %s1, %s1, %s3
; CHECK-NEXT:    cmov.w.gt %s0, %s2, %s1
; CHECK-NEXT:    or %s11, 0, %s9
  %5 = icmp sgt i32 %0, 12
  %6 = select i1 %5, i32 %2, i32 %3
  ret i32 %6
}

define i32 @selectccsge(i32, i32, i32, i32) {
; CHECK-LABEL: selectccsge:
; CHECK:       .LBB{{[0-9]+}}_2:
; CHECK-NEXT:    adds.w.sx %s1, %s0, (0)1
; CHECK-NEXT:    adds.w.sx %s2, %s2, (0)1
; CHECK-NEXT:    adds.w.sx %s0, %s3, (0)1
; CHECK-NEXT:    or %s3, 11, (0)1
; CHECK-NEXT:    cmps.w.sx %s1, %s1, %s3
; CHECK-NEXT:    cmov.w.gt %s0, %s2, %s1
; CHECK-NEXT:    or %s11, 0, %s9
  %5 = icmp sge i32 %0, 12
  %6 = select i1 %5, i32 %2, i32 %3
  ret i32 %6
}

define i32 @selectccslt(i32, i32, i32, i32) {
; CHECK-LABEL: selectccslt:
; CHECK:       .LBB{{[0-9]+}}_2:
; CHECK-NEXT:    adds.w.sx %s1, %s0, (0)1
; CHECK-NEXT:    adds.w.sx %s2, %s2, (0)1
; CHECK-NEXT:    adds.w.sx %s0, %s3, (0)1
; CHECK-NEXT:    or %s3, 12, (0)1
; CHECK-NEXT:    cmps.w.sx %s1, %s1, %s3
; CHECK-NEXT:    cmov.w.lt %s0, %s2, %s1
; CHECK-NEXT:    or %s11, 0, %s9
  %5 = icmp slt i32 %0, 12
  %6 = select i1 %5, i32 %2, i32 %3
  ret i32 %6
}

define i32 @selectccsle(i32, i32, i32, i32) {
; CHECK-LABEL: selectccsle:
; CHECK:       .LBB{{[0-9]+}}_2:
; CHECK-NEXT:    adds.w.sx %s1, %s0, (0)1
; CHECK-NEXT:    adds.w.sx %s2, %s2, (0)1
; CHECK-NEXT:    adds.w.sx %s0, %s3, (0)1
; CHECK-NEXT:    or %s3, 13, (0)1
; CHECK-NEXT:    cmps.w.sx %s1, %s1, %s3
; CHECK-NEXT:    cmov.w.lt %s0, %s2, %s1
; CHECK-NEXT:    or %s11, 0, %s9
  %5 = icmp sle i32 %0, 12
  %6 = select i1 %5, i32 %2, i32 %3
  ret i32 %6
}

define i32 @selectccugt(i32, i32, i32, i32) {
; CHECK-LABEL: selectccugt:
; CHECK:       .LBB{{[0-9]+}}_2:
; CHECK-NEXT:    adds.w.sx %s1, %s0, (0)1
; CHECK-NEXT:    adds.w.sx %s2, %s2, (0)1
; CHECK-NEXT:    adds.w.sx %s0, %s3, (0)1
; CHECK-NEXT:    or %s3, 12, (0)1
; CHECK-NEXT:    cmpu.w %s1, %s1, %s3
; CHECK-NEXT:    cmov.w.gt %s0, %s2, %s1
; CHECK-NEXT:    or %s11, 0, %s9
  %5 = icmp ugt i32 %0, 12
  %6 = select i1 %5, i32 %2, i32 %3
  ret i32 %6
}

define i32 @selectccuge(i32, i32, i32, i32) {
; CHECK-LABEL: selectccuge:
; CHECK:       .LBB{{[0-9]+}}_2:
; CHECK-NEXT:    adds.w.sx %s1, %s0, (0)1
; CHECK-NEXT:    adds.w.sx %s2, %s2, (0)1
; CHECK-NEXT:    adds.w.sx %s0, %s3, (0)1
; CHECK-NEXT:    or %s3, 11, (0)1
; CHECK-NEXT:    cmpu.w %s1, %s1, %s3
; CHECK-NEXT:    cmov.w.gt %s0, %s2, %s1
; CHECK-NEXT:    or %s11, 0, %s9
  %5 = icmp uge i32 %0, 12
  %6 = select i1 %5, i32 %2, i32 %3
  ret i32 %6
}

define i32 @selectccult(i32, i32, i32, i32) {
; CHECK-LABEL: selectccult:
; CHECK:       .LBB{{[0-9]+}}_2:
; CHECK-NEXT:    adds.w.sx %s1, %s0, (0)1
; CHECK-NEXT:    adds.w.sx %s2, %s2, (0)1
; CHECK-NEXT:    adds.w.sx %s0, %s3, (0)1
; CHECK-NEXT:    or %s3, 12, (0)1
; CHECK-NEXT:    cmpu.w %s1, %s1, %s3
; CHECK-NEXT:    cmov.w.lt %s0, %s2, %s1
; CHECK-NEXT:    or %s11, 0, %s9
  %5 = icmp ult i32 %0, 12
  %6 = select i1 %5, i32 %2, i32 %3
  ret i32 %6
}

define i32 @selectccule(i32, i32, i32, i32) {
; CHECK-LABEL: selectccule:
; CHECK:       .LBB{{[0-9]+}}_2:
; CHECK-NEXT:    adds.w.sx %s1, %s0, (0)1
; CHECK-NEXT:    adds.w.sx %s2, %s2, (0)1
; CHECK-NEXT:    adds.w.sx %s0, %s3, (0)1
; CHECK-NEXT:    or %s3, 13, (0)1
; CHECK-NEXT:    cmpu.w %s1, %s1, %s3
; CHECK-NEXT:    cmov.w.lt %s0, %s2, %s1
; CHECK-NEXT:    or %s11, 0, %s9
  %5 = icmp ule i32 %0, 12
  %6 = select i1 %5, i32 %2, i32 %3
  ret i32 %6
}

define i32 @selectccugt2(i32, i32, i32, i32) {
; CHECK-LABEL: selectccugt2:
; CHECK:       .LBB{{[0-9]+}}_2:
; CHECK-NEXT:    adds.w.sx %s1, %s0, (0)1
; CHECK-NEXT:    adds.w.sx %s2, %s2, (0)1
; CHECK-NEXT:    adds.w.sx %s0, %s3, (0)1
; CHECK-NEXT:    or %s3, 12, (0)1
; CHECK-NEXT:    cmpu.w %s1, %s1, %s3
; CHECK-NEXT:    cmov.w.gt %s0, %s2, %s1
; CHECK-NEXT:    or %s11, 0, %s9
  %5 = icmp ugt i32 %0, 12
  %6 = select i1 %5, i32 %2, i32 %3
  ret i32 %6
}

define i32 @selectccuge2(i32, i32, i32, i32) {
; CHECK-LABEL: selectccuge2:
; CHECK:       .LBB{{[0-9]+}}_2:
; CHECK-NEXT:    adds.w.sx %s1, %s0, (0)1
; CHECK-NEXT:    adds.w.sx %s2, %s2, (0)1
; CHECK-NEXT:    adds.w.sx %s0, %s3, (0)1
; CHECK-NEXT:    or %s3, 11, (0)1
; CHECK-NEXT:    cmpu.w %s1, %s1, %s3
; CHECK-NEXT:    cmov.w.gt %s0, %s2, %s1
; CHECK-NEXT:    or %s11, 0, %s9
  %5 = icmp uge i32 %0, 12
  %6 = select i1 %5, i32 %2, i32 %3
  ret i32 %6
}

define i32 @selectccult2(i32, i32, i32, i32) {
; CHECK-LABEL: selectccult2:
; CHECK:       .LBB{{[0-9]+}}_2:
; CHECK-NEXT:    adds.w.sx %s1, %s0, (0)1
; CHECK-NEXT:    adds.w.sx %s2, %s2, (0)1
; CHECK-NEXT:    adds.w.sx %s0, %s3, (0)1
; CHECK-NEXT:    or %s3, 12, (0)1
; CHECK-NEXT:    cmpu.w %s1, %s1, %s3
; CHECK-NEXT:    cmov.w.lt %s0, %s2, %s1
; CHECK-NEXT:    or %s11, 0, %s9
  %5 = icmp ult i32 %0, 12
  %6 = select i1 %5, i32 %2, i32 %3
  ret i32 %6
}

define i32 @selectccule2(i32, i32, i32, i32) {
; CHECK-LABEL: selectccule2:
; CHECK:       .LBB{{[0-9]+}}_2:
; CHECK-NEXT:    adds.w.sx %s1, %s0, (0)1
; CHECK-NEXT:    adds.w.sx %s2, %s2, (0)1
; CHECK-NEXT:    adds.w.sx %s0, %s3, (0)1
; CHECK-NEXT:    or %s3, 13, (0)1
; CHECK-NEXT:    cmpu.w %s1, %s1, %s3
; CHECK-NEXT:    cmov.w.lt %s0, %s2, %s1
; CHECK-NEXT:    or %s11, 0, %s9
  %5 = icmp ule i32 %0, 12
  %6 = select i1 %5, i32 %2, i32 %3
  ret i32 %6
}
